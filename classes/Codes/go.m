function []=go(im)
figure;
[R,G,B]=rgb(im);
figure;
[diffR,diffG,diffB]=graydiff(im,R,G,B);
figure;
[binR,binG,binB]=colorExtract(im,diffR,diffG,diffB);

end