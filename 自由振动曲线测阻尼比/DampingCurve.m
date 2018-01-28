clc;
clear;
%读取数据
[fileID,message]=fopen('damping.dat','r');  %fileID是个非零的正数，读不出来为-1
if fileID==-1
   disp(message);
end
%数据类型为float，分隔符为空格
data=textscan(fileID,'%f %f','headerlines',1,'Delimiter',' '); 
fclose(fileID);
time=data{1};
acceleration=data{2};

%作图
plot(time,acceleration);

%找极大值点的坐标
[peak,location]=findpeaks(acceleration);
hold on; %plot和plot之间要hold住
peak_x=time(location);
peak_y=peak;
% plot(peak_x,peak_y,'ro');

%标注极大值的坐标到图中
for i=1:length(peak_x)
    s=['(',num2str(peak_x(i)),',',num2str(peak_y(i)),')'];
    text(peak_x(i),peak_y(i),s);
end

%坐标轴等图像编辑
xlabel('time(sec)');
ylabel('acceleration(m/s/s)');
title('Free Vibration Test');

%计算阻尼比和自振频率
zeta=1/(2*pi*6)*log(peak_y(2)/peak_y(8));
period=(peak_x(8)-peak_x(2))/6;
damping_frequency=2*pi/period;
natural_frequency=damping_frequency/sqrt(1-zeta^2);

%标注阻尼比和自振频率
s=['阻尼比=',num2str(zeta)];
text(100,0.0022,s);
s=['自振频率=',num2str(natural_frequency)];
text(100,0.002,s);




