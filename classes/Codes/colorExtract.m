function [binR,binG,binB]=colorExtract(im,diffR,diffG,diffB)

 diffR = medfilt2(diffR, [3 3]);
 diffG = medfilt2(diffG, [3 3]);
 diffB = medfilt2(diffB, [3 3]);
   
 binR = im2bw(diffR,graythresh(diffR));
 binG = im2bw(diffG,graythresh(diffG));
 binB = im2bw(diffB,graythresh(diffB));
% th=graythresh(rgb2gray(im));
%  binR = im2bw(diffR,th);
%  binG = im2bw(diffG,th);
% binB = im2bw(diffB,th);

subplot(2,2,1);imshow(im);title('Original');
subplot(2,2,2);imshow(binR);title('Red');
subplot(2,2,3);imshow(binG);title('Green');
subplot(2,2,4);imshow(binB);title('Blue');



end