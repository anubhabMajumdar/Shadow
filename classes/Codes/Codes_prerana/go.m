function []=go(im)
[c,bin]=colorDetect(im);
bw=extractObject(bin);
[ left , right]=arrowBreak(bw);
figure;
subplot(1,2,1);imshow(left);
subplot(1,2,2);imshow(right);

%%
lt=isTriangle(left);
rt=isTriangle(right);

if lt==1
    disp('LEFT ARROW');
else if rt==1
        disp('RIGHT ARROW');
    end
end
% %%
if c==1 
    if lt==1
        disp('TURN RIGHT');
    else if rt==1
            disp('TURN LEFT');
        end
    end
else if c==2
        if lt==1
            disp('TURN LEFT');
        else if rt==1
                disp('TURN RIGHT');
            end
        end
    end
end

end