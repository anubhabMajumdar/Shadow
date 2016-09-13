vid = videoinput('winvideo', 1, 'YUY2_640x480');
im=getsnapshot(vid);
imshow(im);
vid.ReturnedColorSpace='RGB';
im=getsnapshot(vid);
imshow(im);
