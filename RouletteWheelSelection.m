
function choice = RouletteWheelSelection(weights)
  A = sort(weights);
   B=mean(A); 
   C=[];
  for i=1:length(A)
   if A(i)<(B+B*rand());
          C=[C,A(i)];
   end 
  end
  accumulation=cumsum(C);
  p = rand() * accumulation(end);
  chosen_index = -1;
  for index = 1 : length(accumulation)
    if (accumulation(index) > p)
      chosen_index = index;
      break;
    end
  end
  choice = chosen_index;
