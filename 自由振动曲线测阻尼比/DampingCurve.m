clc;
clear;
%��ȡ����
[fileID,message]=fopen('damping.dat','r');  %fileID�Ǹ��������������������Ϊ-1
if fileID==-1
   disp(message);
end
%��������Ϊfloat���ָ���Ϊ�ո�
data=textscan(fileID,'%f %f','headerlines',1,'Delimiter',' '); 
fclose(fileID);
time=data{1};
acceleration=data{2};

%��ͼ
plot(time,acceleration);

%�Ҽ���ֵ�������
[peak,location]=findpeaks(acceleration);
hold on; %plot��plot֮��Ҫholdס
peak_x=time(location);
peak_y=peak;
% plot(peak_x,peak_y,'ro');

%��ע����ֵ�����굽ͼ��
for i=1:length(peak_x)
    s=['(',num2str(peak_x(i)),',',num2str(peak_y(i)),')'];
    text(peak_x(i),peak_y(i),s);
end

%�������ͼ��༭
xlabel('time(sec)');
ylabel('acceleration(m/s/s)');
title('Free Vibration Test');

%��������Ⱥ�����Ƶ��
zeta=1/(2*pi*6)*log(peak_y(2)/peak_y(8));
period=(peak_x(8)-peak_x(2))/6;
damping_frequency=2*pi/period;
natural_frequency=damping_frequency/sqrt(1-zeta^2);

%��ע����Ⱥ�����Ƶ��
s=['�����=',num2str(zeta)];
text(100,0.0022,s);
s=['����Ƶ��=',num2str(natural_frequency)];
text(100,0.002,s);




