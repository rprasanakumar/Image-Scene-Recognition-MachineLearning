function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.

 img = single( img);
    if size(img, 3) > 1
        img =rgb2gray(img);
    end

 [locations, SIFT_features] = vl_dsift(img, 'fast', 'step', 15, 'size', 8);
feat = SIFT_features;
end