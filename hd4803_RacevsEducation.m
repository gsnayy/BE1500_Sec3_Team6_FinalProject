function exit = hd4803_RacevsEducation(Selection)
global adult

raceeducation = adult(:,[9,4]);
EducationList ={ '10th', '11th', '12th', '1st-4th', '5th-6th','7th-8th', '9th', 'Assoc-acdm',...
    'Assoc-voc','Bachelors', 'Doctorate', 'HS-grad', 'Masters','Preschool',...
    'Prof-School','Some-college'}; % creating list of levels of education


switch Selection %using a swicth statement to select data 
   
    case 3
        
        figure('Name', 'General Race and Eduction Data') %naming figure 
         subplot(1,2,1)
         pie(adult.race) %accessing general race data 
         title('General Race Pie Chart')
        subplot(1,2,2)
       pie(adult.education) %general education data
       title('General Education Pie Chart')
            
             x=(raceeducation.race == 'Black')'; % setting x = to all the 'Black" races
        educationBlack = raceeducation(x,:); %accesssing all the black strings in that column
        figure('Name', 'Race vs Education Pie')
            subplot(3,2,1)
            pie(educationBlack.education); % making a pie chart
            title('Black')
            
              x2=(raceeducation.race == 'White')'; % setting x2 = to all the 'white' races
        educationWhite = raceeducation(x2,:);%accesssing all the white strings in that column
            subplot(3,2,2) %plotting multiple graphs on the same figure 
            pie(educationWhite.education);% making a pie chart
            title('White')
           
             x3=(raceeducation.race == ' Asian-Pac-Islander')';%same as above 
        educationAsianPacIslander = raceeducation(x3,:);
            subplot(3,2,3)
            pie(educationAsianPacIslander.education);
            title('Asian-Pac-Islander')
            
             x4=(raceeducation.race == 'Amer-Indian-Eskimo ')';%same as above
        educationAmerIndianEskimo = raceeducation(x4,:);
            subplot(3,2,4)
            pie(educationAmerIndianEskimo.education);
            title('Amer-Indian-Eskimo')
             
              x5=(raceeducation.race == 'Other ')'; %same as above
        educationOther = raceeducation(x5,:);
            subplot(3,2,5)
            pie(educationOther.education);
             title('Other')
   case 4
       
       figure('Name', 'General Race and Education Data')%figure title
        swarmchart(adult.race, adult.education) %swarm chart for race vs education
          title('Race and Education SwarmChart')%graph title 
       
end       
         exit =0;      
end

