function exit = hi7901_UdfHub(root,levelOne,levelTwo)   %**Derrick Hornes**%
    
                %Sends user to selected UDF, stored
                %in selectionMatrix
    %exit = 0;
    load('selectionMatrix.mat','selectionMatrix');
    
    exit = selectionMatrix{root,levelOne,levelTwo}(levelTwo);
    
end
        