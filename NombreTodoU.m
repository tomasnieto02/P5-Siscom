%Ejercicio 2
f1= 100; %Frecuencia de la señal coseno
f2= 50; %Frecuencia de la señal seno
%fs= 2* f1; %Frecuencia de muestreo que es 2 veces la frecuencia max.
%fs= 5* f1; %Frecuencia de muestreo que es 5 veces la frecuencia max.
fs= 20* f1; %Frecuencia de muestreo que es 20 veces la frecuencia max.
ts= 1/fs; %Tiempo de muestreo=inverso de la frecuencia
t = 0:ts:1; %Tiempo, 0, espacionamiento de ts
v= 20*cos(2*pi*f1*t)+10*sin(2*pi*f2*t); %Señal v(t)
figure('Position', [100, 100, 1200, 800]);
subplot(8,4,1) 
plot(t,v); %Grafica de v(t)
axis([0 0.1 -60 60])
title('Grafica de v(t)');
xlabel('tiempo [s]');
text(0.01,35,'señal v(t)')

%Para la señal de ruido
r= randn(size(t));
vr= v+10*r; %Señal vr(t)
subplot(8,4,5) 
plot(t,vr); %Grafica de vr(t) en dominio de tiempo
axis([0 0.1 -60 60])
title('Grafica de vr=v(t)+r');
xlabel('tiempo [s]');
text(0.01,45,'señal vr=v(t)+ruido')


% **** Programa  1.b *****
% Ejercicio 3
N=length(v);
f=-fs/2:fs/(N-1):fs/2; %Para el espectro de magnitud v(f)
vf=(1/N)*fftshift(fft(v));
subplot(8,4,2)
plot(f,abs(vf),'m') %Grafica para v
axis([-150 150 0 15])
title('Espectro de magnitud [v(f)]');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud [Volts]');

vrf=(1/N)*fftshift(fft(vr)); %Para el espectro de magnitud vr(f)
subplot(8,4,6)    
plot(f,abs(vrf),'r') %Grafica para vr
axis([-150 150 0 15])
title('Espectro de magnitud [VRN(f)]');
xlabel('Frecuencia [Hz]');
ylabel('Amplitud [Volts]');


% **** Programa  1.c *****
% Ejercicio 4
subplot(8,4,3)   
plot(f,angle(vf)*180/pi);
axis([-150 150 -200 200])
title('Espectro de Fase [v(f)]');
xlabel('Frecuencia [Hz]');
ylabel('Fase [Graficos]');

%ultima grafica en total 6
subplot(8,4,7) %semodifico para cambiar el orden de las graficas
plot(f,angle(vrf)*180/pi);
axis([-150 150 -200 200])
title('Espectro de Fase [VRN(f)]');
xlabel('Frecuencia [Hz]');
ylabel('Fase [Graficos]');
grid

%Programa  1.d
% Ejercicio 6
subplot(8,4,4)     %En el caso de randn
plot(t,r)  
%axis([0 0.1 -2 2]);
axis([0 0.1 -1 1]);    %se modifco para que sea más parecido a la grafica del manual
title('Grafica de ruido (randn)');
xlabel('Tiempo [s]');
ylabel('Amplitud [Volts]');
r=rand(size(t)); 

subplot(8,4,8)   %En el caso de rand
plot(t,r) 
axis([0 0.1 -2 2]);
title('Grafica de ruido (rand)');
xlabel('Tiempo [s]');
ylabel('Amplitud [Volts]');

set(gcf, 'LooseInset', get(gcf, 'TightInset') + [0.05, 0.05, 0.05, 0.05])
%modificar el tamaño de las imagenes

%La salida sera de 4 figuras con las respectivas graficas

