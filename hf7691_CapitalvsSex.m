function exit=hf7691_CapitalvsSex(X)
global adult
capitalgain=adult.capital_gain;
capitalloss=adult.capital_loss;
capitaltotal=categorical(capitalgain-capitalloss);
capitalTotal=(capitalgain-capitalloss);  %all histogram info uses this one
sex=adult.sex;
neg=0;   %pie stuff
zero=0;
pos=0;
for i=1:32562
    if capitalTotal(i)<0
        neg=neg+1;
    elseif capitalTotal(i)==0
        zero=zero+1;
    elseif capitalTotal(i)>0
        pos=pos+1;
    end
end
capitalx=[neg,zero,pos];
fprintf('select input 3 for combined pie chart of total capital earned for men and women,\nselect input 4 for male and female histograms of total capital earned\n')
if X==3
    pie(capitalx)
    title('Capital: Men and Women')
    legend('<0','=0','>0')
elseif X==4
    histogram(capitalTotal(adult.sex=='Male'))
    title('Male capital')
    xlabel('capital')
    ylabel('number of people')
    figure
    histogram(capitalTotal(adult.sex=='Female'))
    xlabel('capital')
    ylabel('number of people')
    title('Female Capital')
end
exit=0;
end


