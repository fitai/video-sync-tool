%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script : createpath.m
%   -- adds all folders needed for the app
%   -- run script from root folder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
currentdir = pwd;
 
%%% add all code files
addpath(genpath([currentdir]));  
 
%%% add anything that is in the database
%addpath(genpath([currentdir, '\DATABASE\NORMALIZED_TRIALS']));
 
%%% add CODE 
%addpath(genpath([currentdir, '\CODE']));
 
%% add Plots
%addpath(genpath([currentdir, '\PLOTS']));
 
%%% Add Java POI Libs to matlab javapath
%SB, 051817 - might be necessary later
% javaaddpath('CODE/EXCELWRITE/poi_library/poi-3.8-20120326.jar');
% javaaddpath('CODE/EXCELWRITE/poi_library/poi-ooxml-3.8-20120326.jar');
% javaaddpath('CODE/EXCELWRITE/poi_library/poi-ooxml-schemas-3.8-20120326.jar');
% javaaddpath('CODE/EXCELWRITE/poi_library/xmlbeans-2.3.0.jar');
% javaaddpath('CODE/EXCELWRITE/poi_library/dom4j-1.6.1.jar');
% javaaddpath('CODE/EXCELWRITE/poi_library/stax-api-1.0.1.jar');