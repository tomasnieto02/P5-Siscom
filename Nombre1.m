%Ejercicio 1
%Programa 1.a
clc
close all
clear all
f1= 100; %Frecuencia de la señal coseno
f2= 50; %Frecuencia de la señal seno
fs= 10* f1; %Frecuencia de muestreo que es 10 veces la frecuencia max.
ts= 1/fs; %Tiempo de muestreo=inverso de la frecuencia
t = 0:ts:1; %Tiempo, 0, espacionamiento de ts
v= 20*cos(2*pi*f1*t)+10*sin(2*pi*f2*t); %Señal v(t)
subplot(2,1,1) %TENER CUIDADO CON QUE SEA 2,1,1 
plot(t,v); %Grafica de v(t)
axis([0 0.1 -60 60])
title('Grafica de v(t)');
xlabel('tiempo [s]');
text(0.01,35,'señal v(t)');

%Para la señal de ruido
r= randn(size(t));
vr= v+10*r; %Señal vr(t)
subplot(2,1,2) %TENER CUIDADO CON QUE SEA 2,1,2
plot(t,vr); %Grafica de vr(t) en dominio de tiempo
axis([0 0.1 -60 60])
title('Grafica de vr=v(t)+r');
xlabel('tiempo [s]');
text(0.01,45,'señal vr=v(t)+ruido');