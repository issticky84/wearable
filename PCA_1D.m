function [matrix,I_mat] = PCA_1D(histo_mat,cluster_num)
    [sort_mat,I_mat] = sort_descend(histo_mat,cluster_num);
    %sort_mat = sort_mat'; %%%%%%%%%%
    [eigenVector,score,eigenvalue,tsquare] = princomp(sort_mat); 
    k = 1;
    transMatrix = eigenVector(:,1:k);
    matrix = sort_mat * transMatrix;
    %csvwrite('PCA_histo_BigData_20140319_2213_c25.csv',transMatrix);
end