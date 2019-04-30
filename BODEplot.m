[num,txt,raw] = xlsread('Postlabnew.xlsx',3);
H=num(:,5);
%for i = 1:size(num,1)
%H(i)=20*log(num(i,3)/num(i,2));
%end
x=num(:,1);
y1=num(:,12);
y=H;
z=num(:,4);
z1=num(:,18);
subplot(2,1,1);
plot(x,y);
hold on
subplot(2,1,1);
plot(x,y1);
legend('experimental','teoratical');
title('circuit1 Amplitude');
xlabel('frequency(Hz)');
ylabel('Amplitude');
hold on
subplot(2,1,2);
plot(x,z);
hold on
subplot(2,1,2);
plot(x,z1);
legend('experimental','teoratical');
title('circuit1 Angle');
xlabel('frequency(Hz)');
ylabel('angles');