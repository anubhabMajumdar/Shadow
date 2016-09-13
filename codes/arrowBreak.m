function [ left , right]=arrowBreak(bw)
[r,c,t]=size(bw);
i=1;
for j=1:c
    if bw(i,j)==1
        break;
    end
end
left=zeros(r,j);
right=zeros(r,c-j+1);

for i=1:r
    for col=1:j
        left(i,col)=bw(i,col);
    end
end
%figure,imshow(left);

for i=1:r
    column=1;
    for col=j:c
        right(i,column)=bw(i,col);
        column=column+1;
    end
end
%figure,imshow(right);
end