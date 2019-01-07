x = nav_error_1600s;

sd = sqrt(var(x,0,1))*3;

disp('pos_error (km)')
disp(sd(1:3)'/1000)
disp('vel_error (m/s)')
disp(sd(4:6)')
disp('att_error ('')')
disp(sd(7:9)'*60)

% figure
% subplot(3,1,1)
% histogram(x(:,1))
% title('����λ�����ͳ��ֱ��ͼ');
% xlabel('����λ�����(m)');
% subplot(3,1,2)
% histogram(x(:,2))
% xlabel('����λ�����(m)');
% subplot(3,1,3)
% histogram(x(:,3))
% xlabel('�߶����(m)');
% 
% figure
% subplot(3,1,1)
% histogram(x(:,4))
% title('�����ٶ����ͳ��ֱ��ͼ');
% xlabel('�����ٶ����(m/s)');
% subplot(3,1,2)
% histogram(x(:,5))
% xlabel('�����ٶ����(m/s)');
% subplot(3,1,3)
% histogram(x(:,6))
% xlabel('�����ٶ����(m/s)');
% 
% figure
% subplot(3,1,1)
% histogram(x(:,7))
% title('������̬���ͳ��ֱ��ͼ');
% xlabel('��������(\circ)');
% subplot(3,1,2)
% histogram(x(:,8))
% xlabel('���������(\circ)');
% subplot(3,1,3)
% histogram(x(:,9))
% xlabel('��ת�����(\circ)');

clearvars x