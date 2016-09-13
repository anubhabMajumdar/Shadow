% arduino=serial('COM12','BaudRate',9600);
% fopen(arduino);

fprintf(arduino, '%s', 'a');

while (fread(arduino) ~= 1)
end


disp('ack');
