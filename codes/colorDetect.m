function [c,im]=colorDetect(data)
% 0- blank image
% 1- Red
% 2- Green
% 3- Blue

disp('entered in colorDetection');
thresh=6;
c=0;
[r,col,t]=size(data);
im=zeros(r,col);
figure,imshow(data);title('original image');
diffR = imsubtract(data(:,:,1), rgb2gray(data));
diffR = medfilt2(diffR, [3 3]);
%figure,imshow(diffR);%title('filtered R');
diffR = im2bw(diffR,graythresh(diffR));
%figure,imshow(diffR);title('red binarised');
[bwR,R] = bwlabel(diffR, 8);
disp(R);
if R>0 && R<thresh
aR=regionprops(bwR,'Area','ConvexHull','EulerNumber');
areaR=cat(1,aR.Area);
bwR=bwareaopen(bwR,max(areaR)-1);
figure,imshow(bwR);title('Red');
c=1;
im=bwR;
end


diffG = imsubtract(data(:,:,2), rgb2gray(data));
diffG = medfilt2(diffG, [3 3]);
%figure,imshow(diffG);
diffG = im2bw(diffG,graythresh(diffG));
%figure,imshow(diffG);
[bwG,G] = bwlabel(diffG, 8);
disp(G);
if G>0 && G<thresh
aG=regionprops(bwG,'Area','ConvexHull','EulerNumber');
areaG=cat(1,aG.Area);
bwG=bwareaopen(bwG,max(areaG)-1);
figure,imshow(bwG);title('Green');
c=2;
im=bwG;
end


diffB = imsubtract(data(:,:,3), rgb2gray(data));
diffB = medfilt2(diffB, [3 3]);
%figure,imshow(diffB);
diffB = im2bw(diffB,graythresh(diffB));
%figure,imshow(diffB);
[bwB,B] = bwlabel(diffB, 8);
disp(B);
if B>0 && B<thresh
aB=regionprops(bwB,'Area','ConvexHull','EulerNumber');
areaB=cat(1,aB.Area);
bwB=bwareaopen(bwB,max(areaB)-1);
figure,imshow(bwB);title('Blue');
c=3;
im=bwB;
end


disp('Color Detected :');
disp(c);
if c==1
    disp('RED');
else if c==2 
        disp('GREEN');
    else if c==3 
            disp('BLUE');
        end
    end
end


end
