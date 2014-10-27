function draw_raw_data_3D()
    raw_data_3D = read_csv('raw_data_3D.csv');
    range = 100;
    i = 1;
    for j=1:range
        color = raw_data_3D(j,1:3);
        fill([i i+1 i+1 i],[j j j+1 j+1],color); % [x1 x2 x3 x4] [y1 y2 y3 y4]
        hold on    
    end    
end