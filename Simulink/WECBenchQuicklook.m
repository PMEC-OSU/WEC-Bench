close all

%% bus voltages

figure("Name",'Bus Voltages (V)')
plot(output.time,output.driveSignals.DClink_drv_V)
hold on
plot(output.time,output.DUTsignals.busVoltage_V)
% plot(output.time,output.DUTsensors.DUTbusVoltage_V)
legend('drive bus','DUT reported bus','sensor bus')
title('Bus Voltages')
xlabel('time (s)')
ylabel('Bus Voltage (V)')

%% control parameters
figure("Name",'Control Signals')
subplot(2,1,1)
plot(output.time,squeeze(output.DUTsignals.pos_rad))
hold on
plot(output.time,squeeze(output.DUTfeedback.pos_rad_fbk))
legend('measured','filtered')
ylabel('\theta (rad)')
subplot(2,1,2)
plot(output.time,squeeze(output.DUTsignals.vel_radpers))
hold on
plot(output.time,squeeze(output.DUTfeedback.vel_radpers_fbk))
legend('measured','filtered')
ylabel('\omega (rad/s)')

%% power plot

figure('Name','Power (W)')
yyaxis left
plot(output.time,output.DUTsignals.mechPower_W)
xlabel('time (s)')
ylabel('Power (W)')
grid on
yyaxis right
plot(output.time,output.DUTfeedback.damping_Npermpers)
hold on
plot(output.time,output.DUTfeedback.stiffness_Nperm)

legend('Power','Damping','Stiffness')

% %% Drive signals
% 
% figure("Name",'Drive Position (counts)')
% plot(output.time,output.driveSignals.actualPos_counts)
% 
% figure("Name",'Drive Position (rad)')
% plot(output.time,output.driveSignals.pos_rad)
% 
% figure("Name",'Drive Velocity (countspers)')
% plot(output.time,output.driveSignals.vel_countspers)
% 
% figure("Name",'Drive Velocity (radpers)')
% plot(output.time,output.driveSignals.vel_radpers)
% 
% figure("Name",'Drive Velocity (rpm)')
% plot(output.time,output.driveSignals.vel_rpm)
% 
% figure("Name",'Drive Torque (Nm)')
% plot(output.time,output.driveSignals.torque_Nm)
% 
% figure("Name",'Drive Current (A)')
% plot(output.time,output.driveSignals.current_A)
% 
% figure("Name",'Drive DC Link Voltage (V)')
% plot(output.time,output.driveSignals.DClink_V)
% 
% 
% %% Drive Status
% 
% figure("Name",'Drive Temperature (\circ C)')
% plot(output.driveStatus.driveTemp_degC)
% 
% figure("Name",'Drive Enabled')
% plot(output.time,output.driveStatus.enabled)
% 
% 
% %% Timestamp
% 
% figure("Name",'Timestamp')
% plot(output.time,output.timestamp.timestamp)
% 
% figure("Name",'Timestamp (UTC)')
% plot(output.time,output.timestamp.UTCtime)
% 
% figure("Name",'Timestamp (Local)')
% plot(output.time,output.timestamp.LocalTime)
% 
% %% drive sensors
% 
% figure("Name",'Drive Motor temperature sensor')
% plot(output.time,output.driveSensors.motorTemp_degC)
% 
% %% drive commands
% 
% figure("Name",'Drive Motor Command (rad)')
% plot(output.time,squeeze(output.driveCommand.pos_rad))
% 
% %% DUT signals
% 
% figure("Name",'DUT drive bus voltage (V)')
% plot(output.time,output.DUTsignals.busVoltage_V)
% 
% figure("Name",'DUT Current (A)')
% plot(output.time,output.DUTsignals.current_A)
% 
% figure("Name",'DUT Torque (Nm)')
% plot(output.time,output.DUTsignals.torque_Nm)
% 
% figure("Name",'DUT pos (rad)')
% plot(output.time,output.DUTsignals.pos_rad)
% 
% figure("Name",'DUT vel (rad/sec)')
% plot(output.time,output.DUTsignals.vel_radpers)
% 
% % DUT sensors
% 
% figure("Name",'DUT sensor bus voltage (V)')
% plot(output.time,output.DUTsensors.DUTbusVoltage_V)
% 
% % DUT command
% 
% figure("Name",'DUT command current (A)')
% plot(output.time,squeeze(output.DUTcommand.current_A))
% 
% figure("Name",'DUT command torque (Nm)')
% plot(output.time,squeeze(output.DUTcommand.torque_Nm))
% 
