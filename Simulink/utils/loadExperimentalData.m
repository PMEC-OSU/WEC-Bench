clear; clc; close all

sprocketPitchRadius = 0.0636651;

%% setup trial info
share = 'Z:';
year = '2025';
project = 'LUPA7';
experiment = '20250402_Regular';
trial = 'Trial01';

%% load data
dname = fullfile(share,'projects',year,project,'data','onboard',experiment,trial,'\');
fname = dir([dname,'*.mat']);
load([dname,fname.name])

%% extract and condition relevant data
t = output.time;
dt = t(2)-t(1);
zero_range = round(1/dt*(20:dt:30));
pos_dw_m = output.sensors.drawWire_m - mean(output.sensors.drawWire_m(zero_range));
rot_dw_rad = pos_dw_m ./ sprocketPitchRadius;



pos_rad = output.ELMO.pos_rad - mean(output.ELMO.pos_rad(zero_range));

trim_range = round(1/dt*(50:dt:t(end)));
t = t(trim_range);
t = t-t(1);
pos_rad = pos_rad(trim_range);
damping_Npermpers = output.control.damping_Npermpers(trim_range);
stiffness_Nperm = output.control.stiffness_Nperm(trim_range);

r = 40/t(end);
r_win = tukeywin(length(t),r);
pos_rad = pos_rad .* r_win;



elems(1) = Simulink.BusElement;
elems(1).Name = 'pos_rad';
elems(2) = Simulink.BusElement;
elems(2).Name = 'damping_Npermpers';
elems(3) = Simulink.BusElement;
elems(3).Name = 'stiffness_Nperm';
refSigs = Simulink.Bus;
refSigs.Elements = elems;

st.pos_rad = timeseries(pos_rad,t);
st.damping_Npermpers = timeseries(damping_Npermpers,t);
st.stiffness_Nperm = timeseries(stiffness_Nperm,t);

ds = Simulink.SimulationData.Dataset;
ds = ds.add(st,'refSigs');
save('refSigs.mat','refSigs','ds')






figure
yyaxis left
plot(t,pos_rad)

yyaxis right
plot(t,damping_Npermpers)
hold on
plot(t,stiffness_Nperm)

legend('shaft','damping','stiffness')

grid on



