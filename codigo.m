
clear all; clc; 
load prueba_motor_dc.mat


plot(t,U*100,t,W)  % grafica de entrada con relacion a la salida 
%grid on 
kpwm=30;
Va=kpwm*Vc
La=368.5e-3;
Ra=28.8755;
b=1;
J=1;
K=1;

A=[-Ra/La -K/La;K/J -b/J];
B=[kpwm/La;0];
C=[0 1];
D=0;
% seleccion datos de entrenamiento 
N=length(t);
L_train=round(0.7*N);
t_train=t(1:L_train);
Vc_train=U(1:L_train);
W_train=W(1:L_train);

%plot(t,Vc_0*100) % se multiplica la U * 100 para poder comparar la entrada y salida 

% SELECCION DE DATOS DE VALIDACION 
t_val=t(L_train+1:end); % t_val inicie en 0 (el vector inicia en 0)
Vc_val=U(L_train+1:end);
W_val=W(L_train+1:end);

% valores iniciales 

Ra=38.8755;
La=369.5e-3;
J=1;
b=0.1;
Km=1;
%plot(Vc,VaPWM)
