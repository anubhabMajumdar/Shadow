function moveBot(x,arduino)

if x<100
    disp('turn left');
    answer='a';
   
else if x>500
        disp('turn right');
        answer='d';
   
    else
        answer='w';
        disp('go straight');
    end
end
 %fprintf(arduino,'%s',char(answer));
 fprintf(arduino,'%s',answer);

end