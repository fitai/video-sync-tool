function playvideo(video,k,nFrames,time, rms,h, slider,data_sr, data1, data2, data3, v_s, v_e)
 


%play from the begining to the end till the slider is moved
while (k <=(v_e(1)*video.FrameRate-12))  
    
    subplot(7,1,[1 2 3 4 5]);
    frame = read(video, k);
    set(h,'Cdata',frame); 

    drawnow 
    pause(0.0001)

    subplot(7,1,[6 7])
    
    %here might change the plotting - zoom into the current peak
    
    plot(time,data1)
    hold on
    plot(time,data2)  
    hold on
    plot(time,data3)  
    hold on
    xlabel('time(sec)') 
    ylim([-2 12])
    xlim([0 time(end)])  
    
    k2=k-((v_s(1)*video.FrameRate)-12)+1;
     
    line([(((k2)/video.FrameRate)) (((k2)/video.FrameRate))],[0 10])  
    addlines 
    hold off

    k=k+1;     

    set(slider,'Value',k);

end 
    
end