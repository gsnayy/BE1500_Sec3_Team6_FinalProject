function exit = hi7901_ErrorMsg(in)                 %**Derrick Hornes**%

    opts = struct('WindowStyle','modal','Interpreter','tex');
    
    uiwait(errordlg('\fontsize{12} Menu selection out of bounds. Make sure selectionMatrix is configured properly. Check "Menu\_LookupTable\_Creation\_Script.m".',...
        'MENU ERROR',opts));
    
    exit = 1;
end