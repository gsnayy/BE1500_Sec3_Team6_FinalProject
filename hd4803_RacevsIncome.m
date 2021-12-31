function exit  = hd4803_RacevsIncome(Selection)

global adult;
raceincome = adult(:,[9,15]); %accessing the race and income columns

switch Selection 
   
    case 3
        figure ('Name', 'General Race and Income Data') %figure name 
        subplot(1,2,1)%plotting two graphs on one figure
        pie(adult.race) %general race pie chart 
        title('General Race Pie Chart')
        subplot(1,2,2)
        pie(adult.income) %general income pie chart 
        title('General Income Pie Chart')
        
      x=(raceincome.race == 'Black')'; %setting black = 1 in a variable  
        incomeBlack = raceincome(x,:);%retriving all the data where black =1 
        figure('Name', 'Race vs Income Pie')
         subplot(3,2,1)
            pie(incomeBlack.income);  %graphing in a pie chart black vs income
            title('Black')
            
       x2=(raceincome.race == 'White')'; %same as above 
         incomeWhite = raceincome(x2,:);
            subplot(3,2,2)
            pie(incomeWhite.income);
            title('White')
            
        x3 =(raceincome.race == 'Amer-Indian-Eskimo')';%same as above 
             incomeAmerIndianEskimo = raceincome(x3,:);
            subplot(3,2,3)
            pie(incomeAmerIndianEskimo.income);
            title('Amer-Indian-Eskimo')
            
        x4 =(raceincome.race == 'Asian-Pac-Islander')';%same as above 
             incomeAsianPacIslander = raceincome(x4,:);
            subplot(3,2,4)
            pie(incomeAsianPacIslander.income);
            title('Asian-Pac-Islander')
            
         x5 =(raceincome.race == 'Other')';%same as above 
              incomeOther = raceincome(x5,:);
             subplot(3,2,5)
             pie(incomeOther.income);
             title('Other')
             
       
      case 4
          figure('Name', 'General Race and Income Data')
        swarmchart(adult.race, adult.income) %swarm chart of race vs income in adult table
        title('Race and Income SwarmChart')

end
exit =0;   
end

