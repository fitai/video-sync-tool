function playCallBack(hObject, eventdata)
 hObject.UserData = 1;
 clc;
 global video
 global k 
 global nFrames
 global time
 global rms
 global h 
 global slider 
 global data_sr 
 global data1 
 global data2 
 global data3  
 global v_s
 global v_e
 
playvideo(video,k,nFrames,time, rms,h,slider,data_sr, data1, data2, data3, v_s, v_e) 
 

end