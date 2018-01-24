r_max = 0.01;
n_max = 100;
t_max = 100;
D = 1.2e-7;
G = 2.4e-3;
T_inital = 20;
T_ref = 4;

Nr=100;
Nt=100;
r=linspace(0,r_max,Nr); 
t=linspace(0,t_max,Nt); 

[R,T]=meshgrid(r,t); 
Vk=zeros(Nt,Nr,n_max); 

for n = 1:n_max
    Vk(:,:,n)= 2.*r_max./(pi.*R) .* (((-1)^n)/n .* sin(n*pi.*R/r_max) .* exp((n^2.*pi^2)*D.*T/r_max^2)) + T_ref + r_max^2.*G/(6.*D) - R.^2 .* G/(6.*D);
end

N=sum(Vk,3);

figure;
mesh(R,T,Vk);