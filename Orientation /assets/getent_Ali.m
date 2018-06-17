%% Inputs
number_of_regions = 10;
looked_regions = [1,3,2,5,6,7,9,4,10,9];

%% Variable initlization
looks_matrix = zeros(number_of_regions,number_of_regions);
entropy_matix = zeros(number_of_regions,number_of_regions);
row_total = zeros(number_of_regions);
col_total = zeros(number_of_regions);

%% Computing the transition matrix
for looked_index =2:number_of_regions
    from = looked_regions(looked_index-1);
    to = looked_regions(looked_index);
    looks_matrix(from,to) = looks_matrix(from,to)+1;
end

%% Entropy calculations
entropy_matrix = looks_matrix * log2(1/looks_matrix);

columntotals = sum(looks_matrix,1); % option 1 for columns, 2 for rows 
rowtotals = sum(looks_matrix,2);

column_entropy = columntotals * log2(1/columntotals);
row_entropy = rowtotals *  log2(1/rowtotals);

column_entropy_totals = nansum(column_entropy); %nansum excludes nan values
row_entropy_totals = nansum(row_entropy);

correction = (column_entropy_totals + row_entropy_totals)/2;
cellenttotal = nansum(nansum(entropy_matrix));

entropy_total = column_entropy_totals + row_entropy_totals - cellenttotal; 
entropytotal = 1-( entropy_total /correction);


