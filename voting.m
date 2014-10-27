function [histogram] = voting(Tmat,k,cell_row)
    time_step_amount = floor(cell_row/600);
    histogram = zeros(time_step_amount,k);
    t = 1;
    for i=1:time_step_amount
        for s=1:600
           index = Tmat(t,1);
           histogram(i,index) = histogram(i,index) + 1;
           t = t + 1;
        end
    end
end