import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import r2_score

# Load data
def load_file(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
    data = [list(map(int, line.strip().split())) for line in lines if line.strip()]
    return np.array(data)

out = load_file("o256.txt")
correct = load_file("f_correct.txt")

out_real = out[:, 0]
out_imag = out[:, 1]
correct_real = correct[:, 0]
correct_imag = correct[:, 1]

r2_real = r2_score(correct_real, out_real)
r2_imag = r2_score(correct_imag, out_imag)

print(f"R² Score (Real): {r2_real:.6f}")
print(f"R² Score (Imag): {r2_imag:.6f}")

plt.figure(figsize=(12, 6))

plt.subplot(1, 2, 1)
plt.plot(correct_real, label="Correct Real", color='green', linewidth=2)
plt.plot(out_real, label="Output Real", color='red', linestyle='--')
plt.title(f"Real Part (R² = {r2_real:.4f})")
plt.xlabel("Index")
plt.ylabel("Amplitude")
plt.legend()
plt.grid(True)

plt.subplot(1, 2, 2)
plt.plot(correct_imag, label="Correct Imag", color='blue', linewidth=2)
plt.plot(out_imag, label="Output Imag", color='orange', linestyle='--')
plt.title(f"Imaginary Part (R² = {r2_imag:.4f})")
plt.xlabel("Index")
plt.ylabel("Amplitude")
plt.legend()
plt.grid(True)

plt.tight_layout()
plt.show()
