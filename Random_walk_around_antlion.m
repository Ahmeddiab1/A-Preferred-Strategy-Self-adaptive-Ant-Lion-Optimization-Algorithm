


function [RWs]=Random_walk_around_antlion(Dim,max_iter,lb, ub,antlion,current_iter)
if size(lb,1) ==1 && size(lb,2)==1 %Check if the bounds are scalar 
    lb=ones(1,Dim)*lb;
    ub=ones(1,Dim)*ub;
end

if size(lb,1) > size(lb,2) %Check if boundary vectors are horizontal or vertical 
    lb=lb';
    ub=ub';
end

I=1;


if current_iter>max_iter/10
    I=1+100*(current_iter/max_iter)*sin((pi*current_iter*rand())/(2*max_iter))+0.5*100*(current_iter/max_iter);
end

if current_iter>max_iter/2
    I=1+1000*(current_iter/max_iter)*sin((pi*current_iter*rand())/(2*max_iter))+0.5*1000*(current_iter/max_iter);
end

if current_iter>max_iter*(3/4)
    I=1+10000*(current_iter/max_iter)*sin((pi*current_iter*rand())/(2*max_iter))+0.5*10000*(current_iter/max_iter);
end


if current_iter>max_iter*(0.9)
    I=1+100000*(current_iter/max_iter)*sin((pi*current_iter*rand())/(2*max_iter))+0.5*100000*(current_iter/max_iter);
end

if current_iter>max_iter*(0.95)
    I=1+1000000*(current_iter/max_iter)*sin((pi*current_iter*rand())/(2*max_iter))+0.5*1000000*(current_iter/max_iter);
end


lb=lb/(I); 
ub=ub/(I); 



if rand<0.5
    lb=lb+antlion; 
else
    lb=-lb+antlion;
end

if rand>=0.5
    ub=ub+antlion; 
else
    ub=-ub+antlion;
end


for i=1:Dim 
    X = [0 cumsum(2*(rand(max_iter,1)>0.5)-1)']; 
  
     X=X+rand*(max(X)-X);
 
    %[a b]--->[c d]
    a=min(X);
    b=max(X);
    c=lb(i);
    d=ub(i);      
    X_norm=((X-a).*(d-c))./(b-a)+c; 
    RWs(:,i)=X_norm;
end

