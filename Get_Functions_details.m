

function [lb,ub,dim,fobj] = Get_Functions_details(F)


switch F
    case 'F1'
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=100;
        
    case 'F2'
        fobj = @F2;
        lb=-10;
        ub=10;
        dim=100;
        
    case 'F3'
        fobj = @F3;
        lb=-100;
        ub=100;
        dim=100;
        
    case 'F4'
        fobj = @F4;
        lb=-100;
        ub=100;
        dim=100;
        
    case 'F5'
        fobj = @F5;
        lb=-1.28;
        ub=1.28;
        dim=100;
        
    case 'F6'
        fobj = @F6;
        lb=-1;
        ub=1;
        dim=50;
        
    case 'F7'
        fobj = @F7;
          lb=-5.12;
        ub=5.12;
        dim=100;
        
    case 'F8'
        fobj = @F8;
          lb=-32;
        ub=32;
        dim=100;
        
    case 'F9'
        fobj = @F9;
          lb=-600;
        ub=600;
        dim=100;
        
    case 'F10'
        fobj = @F10;
       lb=-50;
        ub=50;
        dim=100;
        
    case 'F11'
        fobj = @F11;
        lb=-5;
        ub=10;
        dim=100;
        
    case 'F12'
        fobj = @F12;
        lb=-4;
        ub=5;
        dim=100;
        
    case 'F13'
        fobj = @F13;
        lb=-100;
        ub=100;
        dim=100;
        
    case 'F14'
        fobj = @F14;
        lb=-100;
        ub=100;
        dim=100;
        
    case 'F15'
        fobj = @F15;
        lb=-100;
        ub=100;
        dim=100;
        
    case 'F16'
        fobj = @F16;
        lb=-100;
        ub=100;
        dim=10;
        
    case 'F17'
        fobj = @F17;
        lb=[-5,0];
        ub=[10,15];
        dim=2;
        
    case 'F18'
        fobj = @F18;
        lb=-2;
        ub=2;
        dim=2;
        
    case 'F19'
        fobj = @F19;
        lb=0;
        ub=1;
        dim=3;
        
    case 'F20'
        fobj = @F20;
        lb=0;
        ub=1;
        dim=6;     
        
    case 'F21'
        fobj = @F21;
        lb=0;
        ub=10;
        dim=4;    
        
    case 'F22'
        fobj = @F22;
        lb=0;
        ub=10;
        dim=4;    
        
    case 'F23'
        fobj = @F23;
        lb=0;
        ub=10;
        dim=4;            
end

end

% F1 Sphere

function o = F1(x)  
o=sum(x.^2);
end

% F2 chwefel’s problem 2.22

function o = F2(x) 
o=sum(abs(x))+prod(abs(x));
end

% F3 Schwefel’s problem1.2

function o = F3(x) 
dim=size(x,2);
o=0;
for i=1:dim
    o=o+sum(x(1:i))^2;
end
end

% F4 Schwefel’s problem2.21

function o = F4(x)
o=max(abs(x));
end

% F5 Quartic

function o = F5(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end

% F6  Sumofdifferentpowers

function o = F6(x) 
d = length(x);
sum = 0;
for ii = 1:d
    xi = x(ii);
    new = (abs(xi))^(ii+1);
    sum = sum + new;
end
o = sum;
end

% F7  Rastrigin

function o = F7(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end

% F8 	Ackley’s

function o = F8(x)
dim=size(x,2);
o=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end

% F9 Griewank

function o = F9(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% F10

function o = F10(x)
dim=size(x,2);
o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
(1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% F11 	Zakharov

function o = F11(x)
dim = size(x,2);
 o = sum(x.^2)+(0.5*sum((1:dim).*x))^2+(0.5*sum((1:dim).*x))^4;
end

% F12  	Powell

function o = F12(x)
d = length(x);
sum = 0;
for ii = 1:(d/4)
	term1 = (x(4*ii-3) + 10*x(4*ii-2))^2;
	term2 = 5 * (x(4*ii-1) - x(4*ii))^2;
	term3 = (x(4*ii-2) - 2*x(4*ii-1))^4;
	term4 = 10 * (x(4*ii-3) - x(4*ii))^4;
	sum = sum + term1 + term2 + term3 + term4;
end
o = sum;
end

% F13   Rosenbrock's Function 多峰函数


function o = F13(x)

d=size(x,2);
o=0;
x(1)=x(1)+1;
for i=1:(d-1)
    x(i+1)=x(i+1)+1;
    t1=x(i)*x(i)-x(i+1);
    t2=x(i)-1;
   o=o+100*t1*t1+t2*t2;
end
 

end

% F14 High Conditioned Elliptic Function多峰函数

function o = F14(x)


dim=size(x,2);
o=sum(((10^6).^(((1:dim)-1)/(dim-1))).*x(1:dim).^2);

end
% F15 Expanded Schaffer's F6 Function

function o = F15(x)

dim=size(x,2);
sum_1=0;
for i=1:dim-1
    sum_1=sum_1+(sin(sqrt(x(i).^2+x(i+1).^2)).^2-0.5)/(1+0.001*(x(i).^2+x(i+1).^2)).^2+0.5;
end
    o=sum_1+(sin(sqrt(x(dim).^2+x(1).^2)).^2-0.5)/(1+0.001*(x(dim).^2+x(1).^2)).^2+0.5;


end
% F16 Non-continuous Rotated Rastrigin's Function多峰函数

function o = F16(x)
dim=size(x,2);
sum_1=0;
for i=1:dim
    if abs(x(i))<1/2
        y(i)=x(i);
    else 
        y(i)=(round(2*x(i)))/2;
    end
    sum_1=sum_1+y(i)^2-10*cos(2*pi*y(i))+10;
end
o=sum_1;
end

function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end
