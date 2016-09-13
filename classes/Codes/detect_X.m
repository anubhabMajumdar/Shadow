function [] = detect_X(img)
[r,c] = size(img);
stats = regionprops(img, 'Centroid', 'BoundingBox');

center = round(stats.Centroid)
top_left = stats.BoundingBox

%%
first_white = 0;
black_count_row = 0;
Y(1:c) = 0;
count =1;

for i=20:c-20
    for j=1:r
        
        if (img(j,i) == 0)
            black_count_row = black_count_row + 1;
        end
        
        if (img(j,i) == 1)
            break;
        end
    end
    Y(count) = black_count_row;
    black_count_row = 0;
    count = count + 1;
end

[r1,c1] = size(Y);

X = 1:c;

figure,plot(X,Y);
title('from top to bottom');

%%

black_count_row = 0;
Y2(1:r) = 0;
count =1;

for i=10:r-10
    for j=1:c
        
        if (img(i,j) == 0)
            black_count_row = black_count_row + 1;
        end
        
        if (img(i,j) == 1)
            break;
        end
    end
    Y2(count) = black_count_row;
    black_count_row = 0;
    count = count + 1;
end

[r2,c2] = size(Y2);

X2 = 1:c2;

figure,plot(X2,Y2);
title('from right to left');

%%
gt_count1 =0;
lt_count1 =0;

for i=1:round(c1/2)
    
    if (Y(1,i)<Y(1,i+2))
        lt_count1 = lt_count1 + 1;
    else
        gt_count1 = gt_count1 + 1;
    end
end
lt_count1
gt_count1


%%

gt_count2 =0;
lt_count2 =0;

diff_total = 0;

for i=1:round(c2/2)
    
    diff_total = diff_total + (Y2(1,i) - Y2(1,i+2));
    
    if (Y2(1,i)<Y2(1,i+2))
        lt_count2 = lt_count2 + 1;
    else
        gt_count2 = gt_count2 + 1;
    end
end
lt_count2
gt_count2

if (lt_count1 > gt_count1) && (lt_count2>gt_count2)
    disp('CROSS');
else
    if (diff_total<1000)
    disp('RIGHT ARROW');
    else
        disp('LEFT ARROW');
    end
    
end

    



end
