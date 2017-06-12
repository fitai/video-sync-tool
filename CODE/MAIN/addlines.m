function addlines 

global ecc_start 
global con_start 
global ecc_end 
global con_end 
global video

 
for i1=1:length(ecc_start)
line([ecc_start(i1)/video.FrameRate ecc_start(i1)/video.FrameRate],[0 20],'Color',[0.9 0.8 0.2])  
end

for i2=1:length(con_start)
line([con_start(i2)/video.FrameRate con_start(i2)/video.FrameRate],[0 20],'Color',[0.2 0.8 0.2])   
end

for i3=1:length(ecc_end)
line([ecc_end(i3)/video.FrameRate ecc_end(i3)/video.FrameRate],[0 20],'Color',[0.9 0.3 0.2])  
end 

for i4=1:length(con_end)
line([con_end(i4)/video.FrameRate con_end(i4)/video.FrameRate],[0 20],'Color',[0.2 0.4 0.8])  
end 


end