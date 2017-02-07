# Image Classification-MachineLearning
Final Machine Learning Project

Prasanna Kumar Rajendran
800938424
Project Proposal
Problem Statement:

In recent years the amount of image data that is being generated has increased exponentially.
Applications like Instagram, Facebook Images and Snapchat have millions of users, all
generating several million images every day. There are around 27,800 images uploaded every
minute to Instagram, which represents data that can be harnessed.
In order to better categorize, manage and obtain useful data from these images, we need to be
able to classify the image data to recognize the objects, people or locations that the image
contains.

We are attempting to identify the most efficient Machine Learning algorithms that can be used
for the purpose of classifying image data.
Our project aims to develop a machine learning system that can be used to recognize images of
specific categories. The categories that we use will be based on the Caltech101 image data set
(http://www.vision.caltech.edu/Image_Datasets/Caltech101/#Download) or a subset of the
dataset.

Approach:
We will be analyzing multiple algorithms for the purpose of image classification, including Naïve
Bayes, K-Nearest Neighbors with/and Support Vector Machines.
Naïve Bayes Nearest Neighbors:
In previous assignments we applied Naïve Bayes as a fast and simple method to classify a bag
of words in text classification. We were able to get a fair amount of accuracy in a short amount
of time. In the image classification problem our aim is to convert the image data into a bag of
“Visual words” and apply the same Bag-Of Words approach to the problem of image
classification.

We will be using KNN to get the centroid of clusters, this would give a provision to convert the
image data in to bag of visual words, and this data can be used to train the Naïve Bayes model.
The reasons for this approach are:-
1- It will represent a baseline for the accuracy and time complexity of the image classification.
2- Applying Naïve Bayes Bag-of-Words approach is not well explored with image data, which
made us want to take up this approach as an experiment.
K-Nearest Neighbors with SVM(Support Vector Machine):
As we are dealing with images, the feature extraction process using Computer Vision algorithms
would result in obtaining many clusters of interesting features. So to get the centroid of clusters,
the best algorithms available is the K-Nearest Neighbors algorithm and to classify the image
data we will use SVM. As per the scientific papers we referred it appears that these two
algorithms together are robust and fast for generating clusters and classifying image data.

Research papers referred:
1. SVM-KNN: Discriminative Nearest Neighbor Classification for Visual Category Recognition
http://www.vision.caltech.edu/Image_Datasets/Caltech101/nhz_cvpr06.pdf
Summary: This paper discusses the hybrid approach of using KNN and local SVM that
preserves the distance function on the collection of neighbors.
2. Naive Bayes Image Classification: beyond Nearest Neighbors
http://www.vision.ee.ethz.ch/~timofter/publications/Timofte-ACCV-2012a.pdf
Summary: This paper discusses that the Naïve Bayes with KNN is the powerful, non-
parametric approach, this is mainly because of not using vectorization.
3. Classification of fruits using computer vision and a multiclass support vector machine.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3478854/
Summary: This paper refers to idea of using KNN with SVM on subset of image data,
multi label classification.
Roles and Responsibilities:
This project will basically have Environment setup (Hadoop, SPRAK set up), Design, Coding,
Testing, Documentation and setting up meetings on regular basis for project status update.

Specific Task assignments

Kranthi Kiran Chinnakotla:

a. Setting up meetings on regular basis
b. Coding

Thomas Neil Kattampallil

a. Design
b. Coding

Prasanna Kumar Rajendran

a. Environment Setup
b.Design
c. Coding

Siddharth Shankar

a.Coding
b.Testing

Measure of Success:
After the analysis of accuracy and time complexity of each algorithms listed above , we
would be able to choose the better algorithm for the provided image data.
