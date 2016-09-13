function [answer]=direction(im)
[c,bin]=colorDetect(im);
bw=extractObject(bin);
[ left , right]=arrowBreak(bw);
%figure;
%subplot(1,2,1);imshow(left);
%subplot(1,2,2);imshow(right);

%%
lt=isTriangle(left);
rt=isTriangle(right);

if lt==1
    disp('LEFT ARROW');
else if rt==1
        disp('RIGHT ARROW');
    end
end
%%
if c==1 
    if lt==1
        disp('TURN RIGHT');
        answer='R';
    else if rt==1
            disp('TURN LEFT');
            answer='L';
        end
    end
else if c==2
        if lt==1
            disp('TURN LEFT');
            answer='L';
        else if rt==1
                disp('TURN RIGHT');
                answer='R';
            end
        end
    end
end

end