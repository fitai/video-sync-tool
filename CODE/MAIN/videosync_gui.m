%Author:Seda Bilaloglu 
%Date:03/19/17 
%Description: this script syncronizes the video with the acceleration data 

%prepare the data 
global data1
global data2
global data3

st=1; %start point !!!!!!!!

%delay=zeros(15,1);
data1= cell2mat(data(st:(end),2));
data2= cell2mat(data(st:(end),3));
data3= cell2mat(data(st:(end),4)); 


global rms;
rms =  sqrt(data1.^2+data2.^2+data3.^2);  

global time
time= (cell2mat(data(st:(end),6))-cell2mat(data(1,6)))/1000;

%this is kind of dynamic
global data_sr;
data_sr=50; 
 
% global sr_convert;
% sr_convert=length(time)/nFrames; 


%the event variables initiation
global ecc_start;  
ecc_start=0;
global ecc_end; 
ecc_end=0;
global con_start;  
con_start=0;
global con_end;
con_end=0;

frame = read(video, 1);

%this k should be determined by the slider
global k
k=v_s(1)*video.FrameRate-12; 


%% below start creating the figure


%% Display first frame and setup handle to image 
global fig
fig=figure; 

%this will start the video, expecting that user will call this one first
playbutton = uicontrol('Style', 'pushbutton', 'String', 'play',...
        'Position', [5 10 50 15],... 
        'UserData',struct('val',0,'diffMax',1),...
        'Callback', @playCallBack);
    
%% slider
    
%length of this should be equal to the frame number and the sensitivity 
  
slidermax=max(time)*data_sr; 
%video.Duration*video.FrameRate 

global slider
slider=uicontrol(fig,'Style','slider','Max',slidermax,'Min',k,...
    'Value',k,'SliderStep',[1/(slidermax-1) 10/(slidermax-1)],...
    'Units','normalized','Position',[.11 .007 0.80 .05],...
    'Callback', @sliderCallBack);   


%% buttons

%change to ecc start
btn1 = uicontrol('Style', 'pushbutton', 'String', 'onlift',...
        'Position', [5 180 50 15],...
        'Callback',  @btn1callback);  
btn2 = uicontrol('Style', 'pushbutton', 'String', 'conc start',...
        'Position', [5 150 50 15],...
        'Callback',  @btn2callback);  
    
%change to ecc end    
btn3 = uicontrol('Style', 'pushbutton', 'String', 'offlift',...
        'Position', [5 120 50 15],...
        'Callback',  @btn3callback); 
    
btn4 = uicontrol('Style', 'pushbutton', 'String', 'conc end',...
        'Position', [5 90 50 15],...
        'Callback', @btn4callback); 
 
btn5 = uicontrol('Style', 'pushbutton', 'String', 'delete',...
        'Position', [5 60 50 15],...
        'Callback', @btn5callback); 
    
set(btn1,'BackgroundColor',[0.9 0.8 0.2]);
set(btn2,'BackgroundColor',[0.2 0.8 0.2]);
set(btn3,'BackgroundColor',[0.9 0.3 0.2]);
set(btn4,'BackgroundColor',[0.2 0.4 0.8]);


%% finish and print
 
 
finishandprint = uicontrol('Style', 'pushbutton', 'String', 'Export',...
        'Position', [5 210 50 15],... 
        'UserData',struct('val',0,'diffMax',1),...
        'Callback', @exportCallBack);

  
%% initital screen 
    
    
%this is an initial screen, setup the window and wait for sliders or
%buttons
subplot(7,1,[1 2 3 4 5])  
global h
h = imshow(frame); 
 





