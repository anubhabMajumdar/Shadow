function [diffR,diffG,diffB]=graydiff(im,R,G,B)
%imshow(im);
%figure;
gray=rgb2gray(im);
%imshow(gray);

diffR=imsubtract(R,gray);
diffG=imsubtract(G,gray);
diffB=imsubtract(B,gray);

subplot(2,2,1);imshow(gray);title('grayscale');
subplot(2,2,2);imshow(diffR);title('Red');
subplot(2,2,3);imshow(diffG);title('Green');
subplot(2,2,4);imshow(diffB);title('Blue');



end