function sliderCallBack(hObject, eventdata)

     global video
     global k 
     global time
     global data1 
     global data2 
     global data3
     global h  
     global v_s 


     
     while(1)
     
     k=hObject.Value;
 
    subplot(7,1,[1 2 3 4 5]);
    frame = read(video, k);
    set(h,'Cdata',frame); 

    drawnow 
    pause(0.0001)

    subplot(7,1,[6 7])   
    
    plot(time,data1)
    hold on
    plot(time,data2)  
    hold on
    plot(time,data3)  
    hold on
    xlabel('time(sec)') 
    ylim([-2 12])
    xlim([0 time(end)])  
    addlines

    k2=k-((v_s(1)*video.FrameRate)-12)+1;
     
    line([(((k2)/video.FrameRate)) (((k2)/video.FrameRate))],[0 10])
    hold off
    k=k+1;      
    
     end

end

