
function [vid_start, vid_end]=video_crop(audio) 

% Design and apply the bandpass filter 
fs=44098; 

%spectrogram(audio,'yaxis') 
[s,w,t]=spectrogram(audio,3000,2400,3000,fs,'yaxis');
%plot(t,s(69,:)) 

%find when s is above 20 (subject to change)  
%can have mean+2stdev 
threshold=mean(real(s(69,:)))+2*std(s(69,:));
index=t(find(s(69,:)>threshold));
%seperate into 2;
sep=find(diff(index)>5);

vid_start=index(1:sep) ;
vid_end=index(sep+1:end); 
 

