function bow = form_bag_of_words_test(model)

%load(model);
load('model.mat')

cluster = vl_kdtreebuild(vocab');
size1=size(vocab,2);

img_path = './val/';
class_num = 30;
img_per_class = 60;
img_num = class_num .* img_per_class;
feat_dim = size(feature_extraction(imread('./val/Balloon/329060.JPG')),2);

folder_dir = dir(img_path);
feat_tests = [];
label_train = zeros(img_num,1);

for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label_train((i-1)*img_per_class+1:i*img_per_class) = i;
    
    for j = 1:length(img_dir)        
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
         img = single( img);
    if size(img, 3) > 1
        img =rgb2gray(img);
    end

            [locations, features] = vl_dsift(img, 'step', 3, 'size', 8);
                [idx , dist] = vl_kdtreequery(cluster , vocab' , double(features));

         
    hist1 = hist(double(idx), size1);
    hist1 = hist1 ./ sum(hist1);
    % feature_hist = feature_hist ./ norm(feature_hist);
    
    feat_test = hist1;

    end
    feat_tests = [feat_tests feat_test];
    
end
    bow = feat_tests;