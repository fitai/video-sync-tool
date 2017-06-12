function btn3callback(hObject, eventdata)

     global video
     global k 
     global time
     global rms
     global h  
     global ecc_end  
     global slider 
     global v_s 

     
     

     
    k=slider.Value;  
    k2=k-((v_s(1)*video.FrameRate)-12)+1;

    ecc_end(end+1)=k2;

 
    subplot(7,1,[1 2 3 4 5]);
    frame = read(video, k);
    set(h,'Cdata',frame); 

    drawnow 
    pause(0.0001)

    subplot(7,1,[6 7])   
    
    plot(time,rms) 
    xlabel('time(sec)') 
    ylim([-10 20])
    xlim([0 time(end)])  
    
    addlines
     
          
    k2=k-((v_s(1)*video.FrameRate)-12)+1;
     
    line([(((k2)/video.FrameRate)) (((k2)/video.FrameRate))],[0 20],'Color',[0.9 0.3 0.2])  



end