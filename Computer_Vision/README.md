## 🖼️ Assignment 1: Basic Operations & Filtering

This assignment focuses on manual implementation of core image processing functions without relying on high-level built-in filtering libraries.

### Key Tasks
* **Grayscale Conversion**: Implementing the transformation $s = 0.3 \cdot R + 0.6 \cdot G + 0.1 \cdot B$.
* **Histogram Analysis**: Creating a custom function to calculate pixel intensities and identify threshold values.
* **Binarization**: Converting images to black and white based on identified thresholds and analyzing pixel counts.
* **Noise Reduction**: 
  * Comparing **Gaussian filters** vs. **Box filters** for Additive White Gaussian Noise.
  * Comparing **Gaussian filters** vs. **Median filters** for Salt and Pepper noise.
  * **Constraint**: Gaussian kernel generation and convolution must be implemented manually.
* **Evaluation**: Performance is measured using the Peak Signal-to-Noise Ratio (PSNR).

---

## 🔍 Assignment 2: Edge Detection Techniques

The second assignment explores advanced edge detection by comparing manual spatial operators against frequency-domain techniques.

### 1. Spatial Domain Edge Detection
Implementations for the following operators (applied to a dataset of 3–5 images):
* **Sobel & Prewitt**: Manual convolution using 3x3 kernels to compute gradient magnitude.
* **Laplacian**: Second-derivative operator used to test noise sensitivity.
* **Canny (OpenCV)**: Experimentation with threshold pairs to observe robustness.
* **Smoothing Impact**: Comparison of different Gaussian kernel sizes ($3 \times 3$, $5 \times 5$, $7 \times 7$) on edge detection results.

### 2. Frequency Domain Edge Detection
* **FFT High-Pass Filtering**: Computing the 2D Fourier Transform and applying high-pass masks.
* **Cutoff Analysis**: Testing $2–3$ different radii to see how "blocked" low-frequency areas affect edge clarity.
* **Spectrum Visualization**: Displaying log-magnitude spectra before and after filtering.

### 3. Quantitative Evaluation
A comparison table is generated for each detector based on **Edge Density**:
$$\text{Edge Density} = \frac{\text{Number of Edge Pixels}}{\text{Total Pixels}}$$
