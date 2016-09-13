function [tri]=isTriangle(bin)
[r,c,t]=size(bin);
%%
ll=round(c/3);
rr=round(2*c/3);
llCount=0;
for i=1:r
    if bin(i,ll)==1
        llCount=llCount+1;
    end
end

rrCount=0;
for i=1:r
    if bin(i,rr)==1
        rrCount=rrCount+1;
    end
end
disp('left count:');
disp(llCount);
disp('right Count:');
disp(rrCount);
%%
thresh=round(r/4);
diff=abs(llCount-rrCount);
disp(diff);
if diff>thresh
    tri=1;
else tri=0;
end

%%
end