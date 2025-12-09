%% WEC-Bench initialization script 
clear; clc; close all;
addpath(genpath('utils'));

%% Assign constants
Ts = 0.001;
CL = 13; % This needs to be set in EASII software and is limited by the drive current (Gold Oboe = 13A)
Kt = 23.6; % +/-10% from motor datasheet
rampTime = 20;
tgName = 'performance4';

load('refSigs.mat')

appName = 'WECBenchApp.mlapp';
buildDir = fullfile('C:','simulink_code');
mdlName = 'WECBench';
appDecimation = 200;
appDecimationAxes = 100;  % reduce info for real time plots

mdlInfo = Simulink.MDLInfo(mdlName);
mdlVersion = mdlInfo.ModelVersion;
set_param(mdlName,'LoadExternalInput','on');
load_system(mdlName);

eniPath = fullfile(pwd,'EtherCAT/DriveMotorXML.xml');
set_param([mdlName,'/EtherCAT Init/EtherCAT Init'],'config_file',eniPath);
set_param(mdlName, 'RTWVerbose','off');

slbuild(mdlName)

allfigs = findall(0,'Type','figure');
app2handle = findall(allfigs,'Name','WECBench');
app2handle.delete
disp('*** Start user app ***')
run(appName)