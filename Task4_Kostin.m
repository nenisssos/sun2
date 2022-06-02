function Task3_Dibirova
clear
clc
Nx=20;%20,50
h=1/(Nx-1);
tau=1e-3;%1e-3,1e-4
Nt=1/tau;
kappa=1;
lambda=kappa*tau/h^2;
T=linspace(0,4,Nt);
X=linspace(0,1,Nx);
%задаём начальные и граничные условия
Fa=0;
Fb=-2*cos(T);
U0=X.^2;
U=zeros(Nt,Nx);
U(1,:)=U0;
%применям явную схему и формулы из лекции с добавкой для краевых условий
%Неймана
for n=1:(Nt-1)
    for i=2:(Nx-1)
        U(n+1,i)=U(n,i)+lambda*(U(n,i+1)-2*U(n,i)+U(n,i-1));
    end
    U(n+1,1)=U(n+1,2)+Fa*h/kappa;
    U(n+1,Nx)=U(n+1,Nx-1)+Fb(n)*h/kappa;
end
%строим решение уравнения теплопроводности при разных t=0-4
figure(1)
plot(X,U(1,:),X,U(251,:),X,U(501,:),X,U(750,:),X,U(1000,:))
legend('t=0','t=1','t=2','t=3','t=4')
figure(2) %если раскомментить эти две строчки 
mesh(X,T,U); %получится решение для любого t
end