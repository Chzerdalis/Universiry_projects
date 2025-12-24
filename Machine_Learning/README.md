## Course Overview
This course provides a comprehensive foundation in machine learning, covering the transition from classical statistical methods to state-of-the-art deep learning architectures. The curriculum balances theoretical understanding with practical application through rigorous laboratory exercises and a data-driven final project.



## Key Learning Modules

### 1. Supervised Learning
Evaluation and implementation of predictive models for classification and regression tasks.
* **Linear & Non-linear Models:** Logistic Regression, Support Vector Machines (SVM), and K-Nearest Neighbors (KNN).
* **Ensemble Methods:** Decision Trees, Random Forests, Bagging, and Boosting (GBM, XGBoost).

### 2. Unsupervised Learning
Techniques for discovering hidden patterns and structure in unlabeled data.
* **Clustering:** K-means, K-Prototype (for mixed data types), and hierarchical clustering.
* **Dimensionality Reduction:** Principal Component Analysis (PCA), t-SNE, and Multiple Correspondence Analysis (MCA) for high-dimensional data visualization.



### 3. Deep Learning & Time-Series Forecasting
Specialized architectures for handling sequential and temporal data.
* **Recurrent Neural Networks:** LSTM and GRU networks designed to capture long-term dependencies.
* **Convolutional Neural Networks (CNNs):** Applied to time-series data for local feature extraction.
* **Transformers:** Modern attention-based models for advanced sequence modeling.



### 4. Natural Language Processing (NLP)
Methods for transforming unstructured text into machine-readable features.
* **Preprocessing:** Tokenization, stemming, lemmatization, and stop-word removal.
* **Feature Extraction:** Bag-of-Words (BoW), TF-IDF, and embeddings from Large Language Models (LLMs).



---

## Laboratory Work

### Lab 3: Customer Segmentation
* **Objective:** Group banking customers based on behavioral data.
* **Key Innovation:** Compared traditional K-means with an LLM-enhanced approach using sentence embeddings to improve cluster separation and interpretability.

### Lab 4: Smart Grid Stability
* **Objective:** Predict the stability of energy grids using environmental and operational metrics.
* **Results:** Conducted a comparative analysis of SVM, KNN, and Decision Trees, identifying tree-based methods as superior for this specific tabular dataset.

### Lab 5: NLP Feature Engineering
* **Objective:** Extract meaningful features from the IMDB movie review dataset.
* **Techniques:** Implemented automated text cleaning pipelines and utilized NLTK for complexity estimation and vocabulary analysis.

---

## Final Project: Residential Energy Consumption Prediction
A deep-dive into time-series forecasting to predict household appliance energy use.
* **The Problem:** Capturing the high variance and temporal cycles in energy consumption based on humidity, temperature, and wind speed.
* **Feature Engineering:** Implemented lag features (t-1, t-2), rolling averages, and cyclical encoding (sine/cosine) for time-of-day and seasonal patterns.
* **Model Benchmarking:** Evaluated GBM and XGBoost against deep learning models (LSTM, GRU, CNN, Transformers), concluding that gradient boosting offered the best balance of accuracy and computational efficiency for this scale of data.



---

## Technical Stack
* **Language:** Python
* **Data Science:** Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn
* **Machine Learning:** XGBoost, CatBoost, PyOD (Outlier Detection)
* **Deep Learning:** TensorFlow, Keras, PyTorch
* **NLP:** NLTK, Transformers (Hugging Face)
