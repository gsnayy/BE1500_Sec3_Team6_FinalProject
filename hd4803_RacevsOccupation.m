function exit = hd4803_RacevsOccupation(Selection)
 global adult; 

Occupation = {'?', 'Adm-clerical', 'Armed-Forces','Craft-repair', 'Exec-managerial',...
    'Farming-fishing','Handlers-cleaners','Machine-op-inspct','Other-service',...
    'Priv-house-serv','Prof-specially','Protective-serv', 'Sales','Tech-Support','Transport-moving'};
%list of all the different occupations
switch Selection
   case 3
       figure('Name', 'General Race and Occupation Data')%name of figure 
       subplot(1,2,1)%plotting multiple graphs on the same figure
        pie(adult.race)%general graph og race
        title('General Race Pie Chart')
        subplot(1,2,2)
        pie(adult.occupation)%general graph of occupation
        title('General Occupation Pie Chart')
        
        raceoccupation = adult(:,[9,7]); %accessing all the data in coloumns 9(race) and 7(occupation)
      x=(raceoccupation.race == 'Black')'; %setting x = to all the black strings/ black = 1
        occupationsBlack = raceoccupation(x,:); %getting all the races from that coloumn where black = 1
        figure('Name', 'Race vs Occupation Pie')
         subplot(3,2,1)
            pie(occupationsBlack.occupation); %graphing black vs occupations in a pie chart
            title('Black')
            
       x2=(raceoccupation.race == 'White')'; %same as above but white =1 
         occupationsWhite = raceoccupation(x2,:);
            subplot(3,2,2)
            pie(occupationsWhite.occupation);
            title('White')
            
        x3 =(raceoccupation.race == 'Amer-Indian-Eskimo')'; %same as above 
             occupationsAmerIndianEskimo = raceoccupation(x3,:);
            subplot(3,2,3)
            pie(occupationsAmerIndianEskimo.occupation);
            title('Amer-Indian-Eskimo')
            
        x4 =(raceoccupation.race == 'Asian-Pac-Islander')'; %same as above
             occupationsAsianPacIslander = raceoccupation(x4,:);
            subplot(3,2,4)
            pie(occupationsAsianPacIslander.occupation);
            title('Asian-Pac-Islander')
            
         x5 =(raceoccupation.race == 'Other')'; %same as above 
              occupationsOther = raceoccupation(x5,:);
             subplot(3,2,5)
             pie(occupationsOther.occupation);
             title('Other')
        
    case 4
        figure('Name', 'General Race and Occupation Data');%figure title 
         swarmchart(adult.race, adult.occupation) %swarm chart for race vs occupation
           title('Race and Occupation SwarmChart')%chart title 

end
exit = 0;
end

