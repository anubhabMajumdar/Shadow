function [R,G,B]=rgb(im)

R=im(:,:,1);
G=im(:,:,2);
B=im(:,:,3);
%figure,imshow(im),figure,imshow(R),figure,imshow(G),figure,imshow(B);


subplot(2,2,1);imshow(im);title('Original image');
subplot(2,2,2);imshow(R);title('Red');
subplot(2,2,3);imshow(G);title('Green');
subplot(2,2,4);imshow(B);title('Blue');

end