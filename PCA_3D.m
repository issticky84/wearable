function matrix = PCA_3D(input_mat)
    %sort_mat = sort_descend(histo_mat);
    %sort_mat = sort_mat';
    %histo_mat = histo_mat';
    [eigenVector,score,eigenvalue,tsquare] = princomp(input_mat); 
    k = 3;
    transMatrix(:,1:k) = eigenVector(:,1:k);
    matrix = input_mat * transMatrix;
    %csvwrite('PCA_histo_BigData_20140330_0006_c25.csv',transMatrix);
end