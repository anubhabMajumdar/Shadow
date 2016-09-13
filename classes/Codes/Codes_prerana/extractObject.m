function [bw]=extractObject(im)
[l,num]=bwlabel(im);
stat=regionprops(l,'BoundingBox','Extrema');

bb=round(cat(1,stat.BoundingBox));
%disp(bb);
im=imcrop(im,bb);

bw=imfill(im,'holes');
figure,imshow(bw);

% stat=regionprops(bw,'Extrema');
% ex=round(cat(2,stat.Extrema));
% disp(ex);


end