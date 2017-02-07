clear all;
close all;
clc;
run('E:\Educational\MyStudies\Sem3\ML\Project_ml\Matlab_ImageClassificaion\approach\vlfeat-0.9.20\toolbox/vl_setup')

img_path = './train/';
class_num = 30;
img_per_class = 60;
img_num = class_num .* img_per_class;
feat_dim = size(feature_extraction(imread('./val/Balloon/329060.JPG')),2);

folder_dir = dir(img_path);
feat_train = zeros(img_num,feat_dim);
label_train = zeros(img_num,1);
voc_size =400;
for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label_train((i-1)*img_per_class+1:i*img_per_class) = i;
    
    for j = 1:length(img_dir)        
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
        feat_train((i-1)*img_per_class+j,:) = feature_extraction(img);
    end
    
end

[centers, assignments] = vl_kmeans(double(feat_train), vocab_size);
vocab = centers';

save('model.mat','vocab','label_train');
