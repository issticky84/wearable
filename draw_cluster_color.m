function draw_cluster_color()
    folder_name = '20141014_1709_refine';
    cluster_RGB_mat = read_csv( strcat(folder_name,'/RGB_20141014_1709_refine_c50.csv') );
    k = 50;
    img_mat = zeros(k,1,3);
    for i=1:k
       img_mat(i,1,1:3) = cluster_RGB_mat(i,1:3); 
    end
    %imwrite(img_mat,'img_mat.png');
    %img_mat = imread('img_mat.png');
    %image(img_mat);
    %axis image
    %axis xy
    
    i = 1;
    for j=1:k
        color = img_mat(j,1,1:3);
        fill([i i+1 i+1 i],[j j j+1 j+1],color); % [x1 x2 x3 x4] [y1 y2 y3 y4]
        hold on    
    end

end