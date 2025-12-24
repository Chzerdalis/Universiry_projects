import os
import re
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

PLOTS_DIR = 'plots/'
METRICS_DIR = 'metrics/'


def parse_out_files(metrics_dir=METRICS_DIR):
    runtime_regex = r"execution time of LSAL SW algorithm is ([0-9.]+) sec"
    runtimes = {}

    for executable in os.listdir(metrics_dir):
        executable_path = os.path.join(metrics_dir, executable)
        if os.path.isdir(executable_path):
            for metrics_file in os.listdir(executable_path):
                if metrics_file.endswith('.out'):
                    try:
                        n, m = map(int, metrics_file.split('.')[0].split('_'))
                        nm_key = f"{n}×{m}"
                    except ValueError:
                        continue

                    with open(os.path.join(executable_path, metrics_file), 'r') as f:
                        content = f.read()

                    match = re.search(runtime_regex, content)
                    if match:
                        runtime = float(match.group(1))
                        runtimes.setdefault(nm_key, {})[executable] = runtime
    return runtimes


def parse_callgrind_files(metrics_dir=METRICS_DIR):
    irefs_regex = r"I\s+refs:\s+([\d,]+)"
    irefs = {}

    for executable in os.listdir(metrics_dir):
        executable_path = os.path.join(metrics_dir, executable)
        if os.path.isdir(executable_path):
            for file in os.listdir(executable_path):
                if file.endswith('.callgrind'):
                    try:
                        n, m = map(int, file.split('.')[0].split('_'))
                        nm_key = f"{n}×{m}"
                    except ValueError:
                        continue

                    with open(os.path.join(executable_path, file), 'r') as f:
                        content = f.read()

                    match = re.search(irefs_regex, content)
                    if match:
                        iref = int(match.group(1).replace(',', ''))
                        irefs.setdefault(nm_key, {})[executable] = iref
                    else:
                        print(f"Warning: No instruction references found in {file}")
    return irefs


def parse_perf_files(metrics_dir=METRICS_DIR):
    metrics_regex = {
        'instructions_core': r"^\s*([\d.,]+)\s+cpu_core/instructions/",
        'instructions_atom': r"^\s*([\d.,]+)\s+cpu_atom/instructions/",
        'cycles_core': r"^\s*([\d.,]+)\s+cpu_core/cycles/",
        'cycles_atom': r"^\s*([\d.,]+)\s+cpu_atom/cycles/",
        'branch_misses_core': r"^\s*([\d.,]+)\s+cpu_core/branch-misses/",
        'branches_core': r"^\s*([\d.,]+)\s+cpu_core/branches/",
        'branch_misses_atom': r"^\s*([\d.,]+)\s+cpu_atom/branch-misses/",
        'branches_atom': r"^\s*([\d.,]+)\s+cpu_atom/branches/",
        'l1_misses': r"^\s*([\d.,]+)\s+L1-dcache-load-misses",
        'l1_loads': r"^\s*([\d.,]+)\s+L1-dcache-loads",
        'llc_misses': r"^\s*([\d.,]+)\s+LLC-load-misses",
        'llc_loads': r"^\s*([\d.,]+)\s+LLC-loads",
        'page_faults': r"^\s*([\d.,]+)\s+page-faults",
    }

    perf_data = {}

    for executable in os.listdir(metrics_dir):
        executable_path = os.path.join(metrics_dir, executable)
        if os.path.isdir(executable_path):
            for file in os.listdir(executable_path):
                if file.endswith('.perf'):
                    try:
                        n, m = map(int, file.split('.')[0].split('_'))
                        nm_key = f"{n}×{m}"
                    except ValueError:
                        continue

                    with open(os.path.join(executable_path, file), 'r') as f:
                        content = f.read()

                    result = {}
                    for metric, pattern in metrics_regex.items():
                        match = re.search(pattern, content, re.MULTILINE)
                        if match:
                            result[metric] = float(match.group(1).replace(',', ''))

                    # Derived metrics
                    if 'branch_misses_core' in result and 'branches_core' in result:
                        result['branch_miss_rate_core'] = result['branch_misses_core'] / result['branches_core']
                    if 'branch_misses_atom' in result and 'branches_atom' in result:
                        result['branch_miss_rate_atom'] = result['branch_misses_atom'] / result['branches_atom']
                    if 'l1_misses' in result and 'l1_loads' in result:
                        result['l1_miss_rate'] = result['l1_misses'] / result['l1_loads']
                    if 'llc_misses' in result and 'llc_loads' in result:
                        result['llc_miss_rate'] = result['llc_misses'] / result['llc_loads']

                    perf_data.setdefault(nm_key, {})[executable] = result
    return perf_data


def plot_metric(data_dict, ylabel, title, filepath, transform_fn=None, log_scale=False):
    if not data_dict:
        print(f"Warning: {title} data is empty. Skipping plot.")
        return

    nm_keys = sorted(data_dict.keys(), key=lambda x: (int(x.split('×')[0]), int(x.split('×')[1])))
    executables = sorted(
        {exe for d in data_dict.values() for exe in d.keys()},
        key=lambda x: (0 if "arm" in x else 1, x)
    )

    data = []
    for nm in nm_keys:
        row = []
        for exe in executables:
            val = data_dict[nm].get(exe, 0)
            val = transform_fn(val) if transform_fn else val
            row.append(val)
        data.append(row)

    x = np.arange(len(nm_keys))
    width = 0.8 / len(executables)

    fig, ax = plt.subplots(figsize=(10, 6))
    for i, exe in enumerate(executables):
        ax.bar(x + i * width, [group[i] for group in data], width, label=exe)

    ax.set_xlabel('N × M Values')
    ax.set_ylabel(ylabel)
    ax.set_title(title)
    ax.set_xticks(x + width * (len(executables) - 1) / 2)
    ax.set_xticklabels(nm_keys, rotation=45)
    if log_scale:
        ax.set_yscale('log')
    ax.legend(title='Executables')

    plt.tight_layout()
    plt.savefig(filepath, dpi=300)


def plot_ipc_from_perf(perf_data, filepath=f'{PLOTS_DIR}/ipc_comparison.png'):
    ipc_dict = {}

    for nm_key, exe_data in perf_data.items():
        ipc_dict[nm_key] = {}
        for exe, metrics in exe_data.items():
            instructions = metrics.get('instructions_core', 0) + metrics.get('instructions_atom', 0)
            cycles = metrics.get('cycles_core', 0) + metrics.get('cycles_atom', 0)
            ipc = instructions / cycles if cycles else 0
            ipc_dict[nm_key][exe] = ipc

    plot_metric(
        ipc_dict,
        ylabel='IPC (Instructions Per Cycle)',
        title='IPC Comparison by N×M Values and Executables',
        filepath=filepath,
        log_scale=False
    )


def plot_cache_miss_rates(perf_data, output_dir=METRICS_DIR):
    # L1 Miss Rate Plot
    l1_miss_rate_dict = {}
    for nm_key, exe_data in perf_data.items():
        l1_miss_rate_dict[nm_key] = {}
        for exe, metrics in exe_data.items():
            l1_miss_rate = metrics.get('l1_miss_rate', 0)
            l1_miss_rate_dict[nm_key][exe] = l1_miss_rate

    plot_metric(
        l1_miss_rate_dict,
        ylabel='L1 Miss Rate',
        title='L1 Cache Miss Rate by N×M Values and Executables',
        filepath=f'{PLOTS_DIR}/l1_miss_rate_comparison.png',
        log_scale=False
    )

    # LLC Miss Rate Plot
    llc_miss_rate_dict = {}
    for nm_key, exe_data in perf_data.items():
        llc_miss_rate_dict[nm_key] = {}
        for exe, metrics in exe_data.items():
            llc_miss_rate = metrics.get('llc_miss_rate', 0)
            llc_miss_rate_dict[nm_key][exe] = llc_miss_rate

    plot_metric(
        llc_miss_rate_dict,
        ylabel='LLC Miss Rate',
        title='LLC Cache Miss Rate by N×M Values and Executables',
        filepath=f'{PLOTS_DIR}/llc_miss_rate_comparison.png',
        log_scale=False
    )


def plot_branch_miss_rates(perf_data, output_dir=PLOTS_DIR):
    # Core Branch Miss Rate Plot
    branch_miss_rate_core_dict = {}
    for nm_key, exe_data in perf_data.items():
        branch_miss_rate_core_dict[nm_key] = {}
        for exe, metrics in exe_data.items():
            branch_miss_rate_core = metrics.get('branch_miss_rate_core', 0)
            branch_miss_rate_core_dict[nm_key][exe] = branch_miss_rate_core

    plot_metric(
        branch_miss_rate_core_dict,
        ylabel='Branch Miss Rate (Core)',
        title='Branch Miss Rate (Core) by N×M Values and Executables',
        filepath=f'{output_dir}/branch_miss_rate_core_comparison.png',
        log_scale=False
    )

    # Atom Branch Miss Rate Plot
    branch_miss_rate_atom_dict = {}
    for nm_key, exe_data in perf_data.items():
        branch_miss_rate_atom_dict[nm_key] = {}
        for exe, metrics in exe_data.items():
            branch_miss_rate_atom = metrics.get('branch_miss_rate_atom', 0)
            branch_miss_rate_atom_dict[nm_key][exe] = branch_miss_rate_atom

    plot_metric(
        branch_miss_rate_atom_dict,
        ylabel='Branch Miss Rate (Atom)',
        title='Branch Miss Rate (Atom) by N×M Values and Executables',
        filepath=f'{output_dir}/branch_miss_rate_atom_comparison.png',
        log_scale=False
    )


def plot_combined_branch_miss_rates(perf_data, output_dir=PLOTS_DIR):
    combined_branch_miss_rate_dict = {}
    for nm_key, exe_data in perf_data.items():
        combined_branch_miss_rate_dict[nm_key] = {}
        for exe, metrics in exe_data.items():
            branch_misses = metrics.get('branch_misses_core', 0) + metrics.get('branch_misses_atom', 0)
            branches = metrics.get('branches_core', 0) + metrics.get('branches_atom', 0)
            combined_branch_miss_rate = branch_misses / branches if branches > 0 else 0
            combined_branch_miss_rate_dict[nm_key][exe] = combined_branch_miss_rate

    plot_metric(
        combined_branch_miss_rate_dict,
        ylabel='Branch Miss Rate',
        title='Branch Miss Rate by N×M Values and Executables',
        filepath=f'{output_dir}/combined_branch_miss_rate_comparison.png',
        log_scale=False
    )


def main():
    matplotlib.use('TkAgg')

    runtimes = parse_out_files(METRICS_DIR)
    plot_metric(
        runtimes,
        ylabel='Runtime (seconds)',
        title='Runtime Comparison by N×M Values and Executables',
        filepath=f'{PLOTS_DIR}/runtime_comparison.png',
        log_scale=True
    )

    perf_data = parse_perf_files(METRICS_DIR)
    plot_ipc_from_perf(perf_data)
    plot_cache_miss_rates(perf_data)
    # plot_branch_miss_rates(perf_data)
    plot_combined_branch_miss_rates(perf_data)

    plt.show()


if __name__ == "__main__":
    main()
