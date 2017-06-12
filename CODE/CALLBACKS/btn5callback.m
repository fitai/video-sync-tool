function btn5callback(hObject, eventdata)
 
global fig 
global ecc_start;  
global ecc_end; 
global con_start;  
global con_end;  


dcm_obj = datacursormode(fig);
set(dcm_obj,'DisplayStyle','datatip',...
    'SnapToDataVertex','off','Enable','on')

disp('Click line to to remove the label, then press Return.')
% Wait while the user does this.
pause 

c_info = getCursorInfo(dcm_obj);
% Make selected line wider
set(c_info.Target,'LineWidth',2)  

index=c_info.Position(1)*video.FrameRate ; 


%here go over all the label arrays 
con_start(find(con_start == round(index)))=[];
con_end(find(con_end == round(index)))=[];
ecc_start(find(ecc_start == round(index)))=[];
ecc_end(find(ecc_end == round(index)))=[];

end