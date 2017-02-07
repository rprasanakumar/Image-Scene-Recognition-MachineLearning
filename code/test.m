% Please do NOT change any thing in this script.
% I will use my own script for grading. 
% It will be exactly the same as this one but with different testing image.
clear; clc; close all;

img_path = './val/';
class_num = 30;
img_per_class = 20;
img_num = class_num .* img_per_class;
feat_dim = size(feature_extraction(imread('./val/Balloon/329060.JPG')),2);

folder_dir = dir(img_path);
feat_tests = [];
label = zeros(img_num,1);

for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label((i-1)*img_per_class+1:i*img_per_class) = i;
    
    for j = 1:length(img_dir)        
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
        feat_test = feature_extraction(img);
    end
    feat_tests = [feat_tests feat_test];
end
%save('model_test.mat','feat_tests');

bag_of_words_test = form_bag_of_words_test(feat_tests);
bag_of_words_training = load('bag_of_words.mat');
model_label = load('model.mat');

predict_label = your_kNN(bag_of_words_training.bag_of_words,bag_of_words_test,bag_of_words_training.label_train);

accuracy = sum(predict_label==label) ./ img_num;
display(accuracy);