function [precision, recall, specificity, npv, acc] = some_statistics(set_participant, set_benchmark, universe)

actual_positives = set_benchmark;
actual_negatives = setdiff(universe, set_benchmark);
predicted_positives = set_participant;
predicted_negatives = setdiff(universe, set_participant);

true_positives  = intersect(actual_positives, predicted_positives);
false_positives = intersect(actual_negatives, predicted_positives);
true_negatives  = intersect(actual_negatives, predicted_negatives);
false_negatives = intersect(actual_positives, predicted_negatives);

precision = length(true_positives)/...
    (length(true_positives) + length(false_positives));
recall    = length(true_positives)/...
    (length(true_positives) + length(false_negatives));
specificity    = length(true_negatives)/...
    (length(true_negatives) + length(false_positives));
npv = length(true_negatives)/...
    (length(true_negatives) + length(false_negatives));
acc = (length(true_positives)+length(true_negatives))/...
    (length(true_positives)+length(true_negatives)+length(false_positives)+length(false_negatives));

end