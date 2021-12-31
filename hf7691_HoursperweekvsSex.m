function exit= hf7691_HoursperweekvsSex(X)
global adult
hoursperweek=categorical(adult.hours_per_week);  %works as categorical
hpw=(adult.hours_per_week);
sex=adult.sex;
low=0;
med=0;
high=0;
for i=1:32562    %to create the pie chart for hours per week 
    if hpw(i)<40
        low=low+1;
    elseif hpw(i)==40
        med=med+1;
    elseif hpw(i)>40
        high=high+1;
    end
end
hpwX=[low,med,high];
fprintf('select input 3 for for combined pie chart of male and female work hours per week,\nselect input 4 for male and female hours per week histogram cart\n')
if X==3
    pie(hpwX)
    legend('<40hrs','=40hrs','>40hrs')
    title('male and female hours')
elseif X==4
    histogram(adult.hours_per_week(adult.sex=='Male'))
    title('Male work hours')
    xlabel('Hours per Week')
    ylabel('Number of people')
    figure                                               
    histogram(adult.hours_per_week(adult.sex=='Female')) 
    title('Female work hours')
    xlabel('Hours per Week')
    ylabel('Number of people')
end
exit=0;
end
