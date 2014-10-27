function cluster_wear()

tic; %time start

k = 25;
file_name = '20140911_0000_2_refine';
mkdir(file_name);

csv_name = '.csv';
file_csv = strcat('csv_data/',file_name);
file_tag = 'output/tag.csv';
file_histo = strcat( strcat(file_name,'/histo_') ,file_name);
file_time = strcat( strcat(file_name,'/time_'), file_name);
file_center = strcat( strcat(file_name,'/cluster_center_'),file_name);

file_csv = strcat(file_csv,csv_name);

file_histo = file_strcat(file_histo,k);
file_time = file_strcat(file_time,k);
file_center = file_strcat(file_center,k);


output = read_sensor_file_wear(file_csv);
%output = read_sensor_file('BigData_20140306_0308.csv');

fprintf('1\n');
cell_row = size(output,1); 
title = [1 2 3 10 11 12 13]; %for wearable(Acc,Gyro,time)
%title = [4 5 6 10 11 12 13]; %for wearable(L_Acc,Gyro,time)
title_num = length(title); %title_num = 14
%%%%%%%%%%%%%%%%%%%%%% save data in matrix %%%%%%%%%%%%%%%%%%%%%%%%%
%[AllMat] = matrix_assignment(output,cell_row,title_num,title);
[AllMat] = set_matrix_2(output,cell_row,title_num,title,file_time);
fprintf('2\n');
%disp(AllMat);
%%%%%%%%%%%%%%%%%%% K-means clustering %%%%%%%%%%%%%%%%%%%%
[Idx,C] = kmeans(AllMat,k,'dist','sqEuclidean','rep',4,'emptyaction','singleton');
%[Idx] = kmeans(AllMat,k,'dist','sqEuclidean','rep',4);
csvwrite(file_tag,Idx);
csvwrite(file_center,C);
fprintf('3\n');
%%%%%%%%%%%%%%%%%%% Sampling %%%%%%%%%%%%%%%%%%%%
Tmat = read_csv(file_tag); %read tag_mat so that K-means clustering result stay fixed
%cluster_histogram = sampling_2(Tmat,k,cell_row);
cluster_histogram = voting(Tmat,k,cell_row);
csvwrite(file_histo,cluster_histogram);
fprintf('4\n');

t = toc; %time end
disp(t);


end %end of function