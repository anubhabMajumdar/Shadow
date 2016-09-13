%% open serial comm
% arduino=serial('COM6','BaudRate',9600);
% fopen(arduino);

% arduino=1;
% 
% %% initialise video input
%  vid = videoinput('winvideo', 1, 'YUY2_640x480');
%  vid.ReturnedColorSpace='RGB';
% 
%% capture the arrow and detect it
%im = imread('greenRight.jpg');
im=getsnapshot(vid);
imshow(im);
dir=direction(im);
fprintf(arduino,'%s',dir);  % R- right ,L- Left
%% start the object tracking
 ack= fread(arduino);
 if ack==1
     % object tracking starts
     set(vid, 'FramesPerTrigger', Inf);
     vid.FrameGrabInterval = 1;
     %start the video aquisition here
     start(vid);
     while(1)
         im=getsnapshot(vid);
         [c,bin]=colorDetect(im);
         if c==1
             disp('red cross detected');
             disp('end of run');
             fwrite(arduino, '%s', 'E');
             break
         else 
             follow(bin,arduino);
         end
     end
     stop(vid);
 
end