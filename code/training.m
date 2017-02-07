clear; clc; close all;

img_path = './train/';
class_num = 30;
img_per_class = 60;
img_num = class_num .* img_per_class;
folder_dir = dir(img_path);
label_train = zeros(img_num,1);
image_vector=[];
for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label_train((i-1)*img_per_class+1:i*img_per_class) = i;
    
    for j = 1:length(img_dir)        
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
        
        
        
        img2 = imresize(img,[1000 2000]);
      if size(img2,3)==3
        img2 = rgb2gray(img2);   
      end
     [r c] = size(img2);
    I = reshape(img2, [r*c, 1]);
    % Trying to extract features from Image and use for forming the image vector
%        name_detect = 'MetricThreshold';
%        value_detect = 100;
%        name_SURF = 'SURFSize';
%        value_SURF = 128;
%        strong_pts= 50;
%        interestingPoints= detectSURFFeatures(img2,name_detect,value_detect);
%        [feature,points] = extractFeatures(img2,interestingPoints.selectStrongest(strong_pts),name_SURF,value_SURF);
%        
%         disp(i);
%         disp(size(feature));
        image_vector=[image_vector I];
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%% Generate%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% the first %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% principle %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% component%%%%%%%%%%%%%%%

%Mean of all the images
image_mean = mean(image_vector,2);
fprintf('Done! ---> With image mean');
% Calculating the standard deviation of each image from the mean
[x,y] = size(image_vector);
image_sd = ones(x,y);

for i=1:image_size
    vector= double(image_vector(:,i));
    image_sd(:,i) = vector- image_mean;
end

image_cv = cov(image_sd);
[eigen_vector, eigen_value] = eig(image_cv);

% forming the Eigenvector face vector
eigenvectorfeature =[];
eigenvector = eigen_vector' * image_sd';

for i=1:image_size
        temp = eigenvector * image_sd(:,i);
        eigenvectorfeature = [eigenvectorfeature temp];
end
save('model.mat','eigenvectorfeature','eigenvector','image_mean','ID_label','-v7.3');
