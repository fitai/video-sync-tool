%author:Seda Bilaloglu 
%date:051617 
%description: this script connects to the database and starts the video app   
 
clc 
clear all 
close all
 
%connect the data base and pull all lift ids 
datasource = 'fitai';
username = 'db_user';
password = 'dbuserpassword';
driver = 'org.postgresql.Driver';
url = 'jdbc:postgresql://fitai-db-1.cls1x0o0bifh.us-east-1.rds.amazonaws.com:5432/fitai';

conn = database(datasource,username,password,driver,url);

% pull the subject ids 
sql='SELECT DISTINCT lift_id FROM lift_data'; % Gets all records 
curs = exec(conn,sql); 

curs = fetch(curs);
str = curs.Data; 

%prompt user for input - for the data to be processed. 

[s,v] = listdlg('PromptString','Select a lift to be processed:',...
                'SelectionMode','single',...
                'ListString',cellfun(@num2str, str, 'UniformOutput', false));  
  
%pull the data  
%str(s) is the lift id selected

sql2=strcat('SELECT * FROM lift_data WHERE lift_id = ',num2str(cell2mat(str(s)))); % Gets all records 
curs2 = exec(conn,sql2); 

curs2 = fetch(curs2);
global data 
data= curs2.Data;

%filename is same as lift id
global filename 
filename=num2str(cell2mat(str(s))); 

close(conn)  


%find the video 
cd('DATABASE/VIDEOS')  
videoname=strcat(filename,'.mov');  
audioname=strcat(filename,'.m4a');  

global audio 
audio =audioread(audioname);

global video
video = VideoReader(videoname);  

global nFrames
nFrames=video.NumberOfFrames;  

global v_s 
global v_e

%audio cropping here 
[v_s, v_e]=video_crop(audio);





%initilize the data and the video 
%% 
%call app gui 
videosync_gui

