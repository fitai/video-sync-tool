function exportCallBack() 

global ecc_start;  
global ecc_end; 
global con_start;  
global con_end;  
global filename;   
global video;


%delete 0's----------------- 
ecc_start=ecc_start(2:end)./video.FrameRate;
ecc_end= ecc_end(2:end)./video.FrameRate;
con_start= con_start(2:end)./video.FrameRate;
con_end= con_end(2:end)./video.FrameRate;

input = cell(1,3);

%change this later
for i1=1:length(ecc_start)  
    
input(end+1,:)={str2num(filename),ecc_start(i1),'onset'};
     
end  

%change this later

for i2=1:length(ecc_end)  
   
input(end+1,:)={str2num(filename),ecc_end(i2),'offset'};
     
end  

for i3=1:length(con_start)  
    
input(end+1,:)={str2num(filename),con_start(i3),'con_start'};
     
end  

for i4=1:length(con_end)  
    
input(end+1,:)={str2num(filename),con_end(i4),'con_end'};
     
end 

%input format 
%colnames = {'lift_id' , 'timepoint', 'event'};
input(all(cellfun('isempty',input),2),:) = [];
  
pushintodb(input)  

close all 

error('Program terminated')

end