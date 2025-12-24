import numpy as np
import matplotlib.pyplot as plt
import sys

np.random.seed(43)

try:
    N = int(sys.argv[1])
except IndexError:
    N = 16

freqs = np.sort(np.random.randint(1, N/2, size=30))
ampls = (np.abs(freqs / (N/4) - 1) - 1)**4

t = np.linspace(0, 1, N)
x = np.zeros(len(t))

for freq, ampl in zip(freqs, ampls):
    x += ampl * np.sin(2 * np.pi * freq * t)

x = 2 * (x - x.min()) / (x.max() - x.min()) - 1

x = (x * 0x7FFF).astype(int)
x_fft = np.fft.fft(x, len(x))
x_fft.real = x_fft.real.astype(int)
x_fft.imag = x_fft.imag.astype(int)

plt.plot(t, x)
plt.plot(t, x_fft.real)
plt.plot(t, x_fft.imag)
plt.show()

k = np.arange(N)
twiddles = np.exp(-2j * np.pi * k / N)

twiddle_real_q = np.clip(twiddles.real * (1 << 15), -0x8000, 0x7FFF).astype(int) & 0xFFFF
twiddle_imag_q = np.clip(twiddles.imag * (1 << 15), -0x8000, 0x7FFF).astype(int) & 0xFFFF

######### SW #########

# with open('f_input.txt', 'w') as f:
#     for xi in x:
#         f.write(f'{xi}\n')

# with open('f_correct.txt', 'w') as f:
#     for xi in x_fft:
#         f.write(f'{int(xi.real)} {int(xi.imag)}\n')

# with open(f'f_twiddle.txt', 'w') as f:
#     for twr, twi in zip(twiddle_real_q, twiddle_imag_q):
#         f.write(f'{twr} {twi}\n')

######### HW #########

def sign(n):
    return '-' if n < 0 else ''

def bitrev(num, n):
    res = 0
    for i in range(n):
        bit = (num >> i) & 1
        res |= bit << (n - 1 - i)
    return res

with open(f'../f_input_{N}.vh', 'w') as f:
    for i, xi in enumerate(x):
        xir = int(xi)
        f.write(f'input_real[{i}] = {sign(xir):}32\'sd{abs(xir)};\n')

with open(f'../f_input_rev_{N}.vh', 'w') as f:
    for i, xi in enumerate(x):
        xir = int(xi)
        f.write(f'input_real[{bitrev(i, np.log2(N).astype(int))}] = {sign(xir):}32\'sd{abs(xir)};\n')

with open(f'../f_correct_{N}.vh', 'w') as f:
    for i, xi in enumerate(x_fft):
        xir, xii = int(xi.real), int(xi.imag)
        f.write(f'correct_real[{i}] = {sign(xir)}32\'sd{abs(xir)}; correct_imag[{i}] = {sign(xii)}32\'h{abs(xii)};\n')

with open(f'../f_twiddle_{N}.vh', 'w') as f:
    for i, (twr, twi) in enumerate(zip(twiddle_real_q, twiddle_imag_q)):
        f.write(f'w_real[{i}] = 16\'h{twr:04X}; w_imag[{i}] = 16\'h{twi:04X};\n')