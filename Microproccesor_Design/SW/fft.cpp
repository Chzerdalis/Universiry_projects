#include <fstream>
#include <sstream>
#include "cplx.h"

#define PI 3.14159265358979323846
#define N 16
#define STAGES_R2 4
#define STAGES_R4 2

void bit_reverse(cplx x[N]) {
    int i, j, k;
    for (i = 1, j = 0; i < N; i++) {
        k = N >> 1;
        while (j & k) {
            j ^= k;
            k >>= 1;
        }
        j ^= k;
        if (i < j) {
            cplx tmp = x[i];
            x[i] = x[j];
            x[j] = tmp;
        }
    }
}

void bit_reverse_radix4(cplx x[N]) {
    unsigned int j = 0;
    for (unsigned int i = 0; i < N; ++i) {
        if (i < j) {
            cplx temp = x[i];
            x[i] = x[j];
            x[j] = temp;
        }

        // Compute next j
        unsigned int k = N / 4;
        while (k > 0 && j >= 3 * k) {
            j -= 3 * k;
            k /= 4;
        }
        j += k;
    }
}

static cplx twiddle_table[N];

void print_complex_array(const cplx x[N]) {
    for (int i = 0; i < N; i++) {
        std::cout << "X[" << i << "] = " << x[i] << '\n';
    }
}

void radix2_fft(cplx x[N]) {
    bit_reverse(x);

    for (int s = 0; s < STAGES_R2; s++) {
        int m = 1 << (s + 1);
        int step = N / m;

        for (int k = 0; k < N; k += m) {
            for (int j = 0; j < m / 2; j++) {
                int idx0 = k + j;
                int idx1 = idx0 + m / 2;

                cplx a = x[idx0];
                cplx b = x[idx1] * twiddle_table[j * step];

                b.Real /= 0x7FFF; b.Imag /= 0x7FFF;

                x[idx0] = a + b;
                x[idx1] = a - b;
            }
        }
    }
}

void radix4_fft(cplx x[N]) {
    bit_reverse_radix4(x);

    for (int s = 0; s < STAGES_R4; s++) {
        int m = 1 << (2 * (s + 1));
        int step = N / m;

        for (int k = 0; k < N; k += m) {
            for (int j = 0; j < m / 4; ++j) {
                int idx0 = k + j;
                int idx1 = idx0 + m / 4;
                int idx2 = idx1 + m / 4;
                int idx3 = idx2 + m / 4;

                cplx a = x[idx0];
                cplx b = x[idx1] * twiddle_table[j * step];
                cplx c = x[idx2] * twiddle_table[2 * j * step];
                cplx d = x[idx3] * twiddle_table[3 * j * step];

                b.Real /= 0x7FFF; b.Imag /= 0x7FFF;
                c.Real /= 0x7FFF; c.Imag /= 0x7FFF;
                d.Real /= 0x7FFF; d.Imag /= 0x7FFF;

                cplx t0 = a + c;
                cplx t1 = a - c;
                cplx t2 = b + d;
                cplx t3 = (b - d) * cplx(0, -1);

                x[idx0] = t0 + t2;
                x[idx1] = t1 + t3;
                x[idx2] = t0 - t2;
                x[idx3] = t1 - t3;
            }
        }
    }
}

double mag2(cplx z) {
    return z.Real * z.Real + z.Imag * z.Imag;
}

double r2(cplx *out, cplx *correct) {
    cplx mean;
    for (int i = 0; i < N; ++i) {
        mean = mean + correct[i];
    }

    mean.Real /= N; mean.Imag /= N;

    double ss_res = 0.0;
    double ss_tot = 0.0;

    for (int i = 0; i < N; ++i) {
        ss_res += mag2(correct[i] - out[i]);
        ss_tot += mag2(correct[i] - mean);
    }

    if (ss_tot == 0.0) return 0.0;

    return 1.0 - (ss_res / ss_tot);
}

int main() {
    cplx x[N], x_correct[N];

    {
        std::ifstream input_file("f_input.txt");
        std::ifstream correct_file("f_correct.txt");
        std::ifstream twiddle_file("f_twiddle.txt");

        for (int i = 0; i < N; i++) {
            input_file >> x[i].Real;
            x[i].Imag = 0.0;
            correct_file >> x_correct[i].Real >> x_correct[i].Imag;

            int twr, twi;
            twiddle_file >> twr >> twi;
            twiddle_table[i] = { (int64_t)((int16_t)twr), (int64_t)((int16_t)twi) };
            std::cout << twiddle_table[i] << "\n";
        }
    }

    radix2_fft(x);

    std::cout << "FFT Output:\n";
    print_complex_array(x);

    cplx diff[N];
    for (int i = 0; i < N; i++) {
        diff[i] = x[i] - x_correct[i];
    }

    print_complex_array(diff);

    int n_correct = 0;
    for (int i = 0; i < N; i++) {
        if (diff[i].Real == 0 && diff[i].Imag == 0) {
            n_correct++;
        }
    }

    std::cout << n_correct << "/" << N << " Correct Outputs\n";
    std::cout << "R^2 = " << r2(x, x_correct) << "\n";
    
    return 0;
}