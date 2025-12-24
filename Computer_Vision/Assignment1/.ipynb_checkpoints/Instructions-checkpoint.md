# ECE457-UTH
Introduction to Computer Vision


## Creation of a Python environment using Anaconda.
Install **Miniconda** (a lightweight version of Anaconda) by following the instructions provided [here](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) for each operating system.

After installing Miniconda, open terminal and use commands from the [Conda cheatsheet] https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf to set up our environment.

1) Creation of Python 3.11 environment - `conda create --name ece457_env python=3.11`
2) Verification of environment creation - `conda env list`
3) Environment activation - `activate ece352_env`
4) Installation of packages in the Python 3.11 environment - **Example** `pip install matplotlib`

**Packages**
The first packages to be installed concern the following image processing libraries:

* [matplotlib](https://matplotlib.org/)
* [imageio](https://imageio.readthedocs.io/en/stable/)
* [numpy](https://numpy.org/)

Install **Jupyter Notebook** in the Python environment you created using the command `pip install notebook`, and then open the notebook with the command `jupyter notebook`.

If the above process has been completed correctly, Jupyter Notebook will have opened a new window in the browser you have set as default on port 8888, and you will see the user directory.

## Create a New Notebook

1. Navigate to the Documents folder and create a new folder named ECE457 using the `New` option, then select `rename folder` within the Jupyter Notebook.

2. Use the `New` option and then select Python 3 (ipykernel) to create a new notebook in the folder you created in the previous step (ECE457).

3. After creating your first notebook, rename it to `Assignment 1`

**To become familiar with the Jupyter Notebook interface, please read the online manual [here](https://jupyter-notebook.readthedocs.io/en/stable/examples/Notebook/examples_index.html)
