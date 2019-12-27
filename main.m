clear all 
clc

SearchAgents_no=40; 

Function_name='F1';

Max_iteration=500; 

% Load details of the selected benchmark funcion
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,cg_curve]=ALO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);


%Draw search space


%Draw objective space

semilogy(cg_curve,'Color','r')

xlabel('´úÊý');
ylabel('½â');
    
hold on

legend('PSALO','ALO','WALO','HALO','SSA','ISSA','PPSO')

display(['The best solution obtained by ALO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by ALO is : ', num2str(Best_score)]);

dlmwrite('Aaa.txt',Best_score,'-append','delimiter','\t');       



