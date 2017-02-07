function predict_label = your_kNN(bag_of_words_training,bag_of_words_test,train_label)
% Output should be a fixed length vector [num of img, 1]. 
% Please do NOT change the interface.

%predict_label = zeros(size(feat,1),1); %dummy. replace it with your own code

dist = vl_alldist2(bag_of_words_training', bag_of_words_test');
dist = dist;

predicted_categories = [];
for i = 1:size(bag_of_words_test,1)
    [Y, I] = min(dist(i, :));
    label = train_label(I, 1);
    predicted_categories = [predicted_categories; label];
end
predict_label=predicted_categories;
end