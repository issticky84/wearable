function matrix = PCA_1D_2(histo_mat)
    %sort_mat = sort_descend(histo_mat,cluster_num);
    %sort_mat = sort_mat'; %%%%%%%%%%
    [eigenVector,score,eigenvalue,tsquare] = princomp(histo_mat); 
    k = 1;
    transMatrix = eigenVector(:,1:k);
    matrix = histo_mat * transMatrix;
    %csvwrite('PCA_histo_BigData_20140319_2213_c25.csv',transMatrix);
end