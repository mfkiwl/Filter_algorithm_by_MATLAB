clc
clear all

dt = 0.2;
t = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples,3); % ��� ���� -> �迭
Zsaved = zeros(Nsamples,1); % ��� ���� -> �迭

for k=1:Nsamples
    z = GetVolt(); % ������ ��
    [volt,Cov,Kg] =  SimpleKalman2(z); % Į�� 
    
    Xsaved(k, :) = [volt,Cov,Kg];
    Zsaved(k) = z; % ������ ����
end

figure
plot(t,Xsaved(:,1),'r:o');
hold on
plot(t,Zsaved,'b:*')
xlabel('Time[sec]')
ylabel('Voltage[V]')
legend('Kalman Filter','Measured')

figure
plot(t,Xsaved(:,2),'r:o');
xlabel('Time[sec]')
ylabel('P')

figure
plot(t,Xsaved(:,3),'r:o');
xlabel('Time[sec]')
ylabel('K')
