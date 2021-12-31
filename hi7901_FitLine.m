function yfit = hi7901_FitLine(x,y,deg)             %**Derrick Hornes**%
clc;

if (length(x)==length(y))
    [fitCoeffs, s] = polyfit(x,y,deg);
    [yfit, ~] = polyval(fitCoeffs, x, s);
    %fprintf('Delta: %f', delta)
else
    disp('Incompatible x and y sizes\n')
end
end