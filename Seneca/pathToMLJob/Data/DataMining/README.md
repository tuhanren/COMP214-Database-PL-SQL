# Data Mining

Data mining includes clustering then classification, association analysis (Market Basket Analysis) and Anomaly detection. Anomaly detection is to find cases do not fit into the clusters, do not have association. Or you might want to predict outcomes according to a lot of variables, which you might want to do variable selection first.  
Data mining also has  

- Sequence mining, which is for time-ordered data.  
- Text mining, find words and phrases that distinguish the unstructured text data.  

Data mining also need dimension reduction, feature engineer to remove noise and find important variables.

## Tools

R, Python, Rapidminer, Knime, Orange, Bigml (online, free for small task).  

## Methods

- Classical Statistics:  
    1. Linear regression, logistic regression, Poisson regression
    2. K-means clustering for classification. Heuristic algorithm, converging quickly to local optimum, clustering n observations into k clusters in which each observation belongs to the cluster with the nearest mean.  
    3. K-nearest neighbors. a non-parametric method for regression and classification. The value or the class membership of the object is decided either by the average of the values of k nearest neighbors or by a popularity vote of its neighbors.  
    4. Hierarchical clustering, top-down or bottom-up.
    5. Naive Bayes.
    6. Principal component analysis.
    7. Linear discriminate analysis.  
- Machine Learning:
    1. Hidden Markov models:  
    Markov processes are the basis for general stochastic simulation methods known as Markov chain Monte Carlo.  
    The Markov property, namely that the probability of moving to the **next state depends only on the present state and not on the previous states**.  
    The simplest Markov model is the Markov chain. It models the state of a system with a random variable that changes through time.  
    Let X_{n} and Y_{n} be discrete-time stochastic processes and n ≥ 1. The pair (X_{n},Y_{n}) is a hidden markov model if:  
    X_{n} is a Markov process and is not directly observable ("hidden");  
    P( Y_{n}\in A | X_{1}=x_{1},\ldots ,X_{n}=x_{n} ) = P( Y_{n}\in A | X_{n}=x_{n} ).  
    for every n ≥ 1, x_{1},\ldots ,x_{n},} and an arbitrary (measurable) set A.  
    2. Support vector machine (SVM)/regression (Better to use in binary classification) **Slow**:
    **Use when many features and few cases, can handle out liers**.  
    This is a classifier to find an optimal hyperplane that **maximizes the margin** between two classes. Support vector is the name of the orthogonal vector from the decision boundary to the closest points. In this case, few data points on the margin are determining the boundary.  
    When data is not linearly separable, such as can only be separated using curved line or plane, **kernel methods** are used to transform the data to a higher dimension.  
    SVM is robust to the curse of high dimensionality, which is large p (variables) and small n (sample size). The important parameter C, the width of the margin, which controls the complexity of the model, influences the bias-variance trade-off a lot. A narrow margin tends to be a complex model.  
    3. Decision trees.  
    4. LASSO regression for choosing variables.  
    5. Neural networks.  
    6. Apriori algorithm:
    Apriori is a popular algorithm for extracting frequent item sets with applications in association rule learning. The apriori algorithm has been designed to operate on databases containing transactions, such as purchases by customers of a store.
    7. Word counts

## Types

### Association analysis (market basket analysis)

Association rule mining deploys pattern recognition to identify and quantify relationships. Such as customer buy eggs tend to buy bread.  
{eggs} -> {bread}  
Works fast, with small data and requires few feature engineering.  
Three ways to measure association:  

1. Support:
    Support is the relative frequency of an item with in a dataset. Support(A) = #Cases(A)/#All Cases.  
2. Confidence
    Confidence is the conditional probability, the probability of an action **A** given another action occurred/another item exists **c**. **If - then**. Based on support.  Confidence(C -> A) = support(C & A)/ support(C).  
3. Lift (lift scores)
    Lift measures how much more often, which is lift(C -> A) = Confidence(C -> A)/ Support(A).  

## Pipeline

### Data reduction

- To avoid multicollinearity
- Get increased degree of freedom
- Avoid overfitting
- Help with interpretability

#### Algorithms for Data reduction

- Linear
  1. Principal component analysis (PCA) to reduce the number of variables (dimensions, features), by maximizing variability in lower-dimensional space.  
  2. Factor analysis which is similar to PCA. Using underlying factors not observing variables and variances.  
- Non-linear (Dimensionality reduction)
  Useful for nonliner manifold such as shape "I" VS. "S", used in computer vision.
  1. Kernel PCA (kernel tricks).  
  2. Others including Isomap (Isometric Feature Mapping),  LLE (locally linear embedding), Maximum variance unfolding.  

### Clustering  
