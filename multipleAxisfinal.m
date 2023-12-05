load('Glider_AZFP_data.mat');
load('NOAA_ship_AZFP_data.mat');
%%
avgGliderAZFP67 = tsnanmean(DataG.Glider_AZFP.fr67.Sv,2);
avgGliderAZFP120 = tsnanmean(DataG.Glider_AZFP.fr120.Sv,2);
Glider_AZFP.fr200.Sv = Glider_AZFP.fr200.Sv';
avgGliderAZFP200 =  tsnanmean(DataG.Glider_AZFP.fr200.Sv,2);

    
%%
% Load glider data (real-time processed)
Data = load('NH_202205201936_osu592.mat');

% Calculate Depth in meters from Pressure in dB and add it to the existing
% structure
Data.Depth_gl = sw_dpth(Data.Press*10, mean(Data.Lat(~isnan(Data.Lat))));

% Calculate Salinity and Density
Data.Salt=sw_salt(Data.Conduct*10./sw_c3515, Data.Temp, Data.Press);
Data.Pdens=sw_pden(Data.Salt,Data.Temp,Data.Press,0)-1000;

% Find depth values not equal to NaN
inotnan=find(~isnan(Data.Depth_gl));
updn_ind=get_min_max(Data.Depth_gl(inotnan), 0.5);

% Plot Depth time series
figure(1)

plot(Data.Julday,Data.Depth_gl, '.-');
hold on;

% As an example plot profile #1261 in red
profile=1261;
% define all points for this profile
ind_profile=(inotnan(updn_ind(profile)):inotnan(updn_ind(profile+1)) );
plot(Data.Julday(ind_profile),Data.Depth_gl(ind_profile),'ro-');
set(gca,'ydir','reverse');
set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);

% Create new variables for selected profile and interpolate all to the same
% sampling interval
TM=Data.Julday(ind_profile);
D=Data.Depth(ind_profile);
T=Data.Temp(ind_profile);
S=Data.Salt(ind_profile);
SigT=Data.Pdens(ind_profile);
C=Data.Chlor(ind_profile);

TM7=Data.Timeinsec(ind_ln7);
D7 = Data.Depth(ind_ln7);
T7 = Data.Temp(ind_ln7);
S7 = Data.Salt(ind_ln7);
SigT7 = Data.Pdens(ind_ln7);
C7 = Data.Chlor(ind_ln7);

C_int=interp1( TM(~isnan(C)), C(~isnan(C)), TM );
D_int=interp1( TM(~isnan(D)), D(~isnan(D)), TM );
T_int=interp1( TM(~isnan(T)), T(~isnan(T)), TM );
S_int=interp1( TM(~isnan(S)), S(~isnan(S)), TM );
SigT_int=interp1( TM(~isnan(SigT)), SigT(~isnan(SigT)), TM );

C7_int=interp1( TM7(~isnan(C7)), C7(~isnan(C7)), TM7 );
D7_int=interp1( TM7(~isnan(D7)), D7(~isnan(D7)), TM7 );
T7_int=interp1( TM7(~isnan(T7)), T7(~isnan(T7)), TM7 );
S7_int=interp1( TM7(~isnan(S7)), S7(~isnan(S7)), TM7 );
SigT7_int=interp1( TM7(~isnan(SigT7)), SigT7(~isnan(SigT7)), TM7 );
%=====================================================
% plot sg temperature, salinity and density profiles =
%=====================================================
%%
figure(2)

plot( T7_int(5497:5548,:), D7_int(5497:5548,:), 'Marker', '.', 'Color', 'r', 'MarkerSize', 6, 'LineStyle', '-.');
ax1 = gca;
set(ax1, 'YDir','reverse', 'XAxisLocation', 'bottom', 'XColor', 'r');
xlabel('\color{red}Temperature (\circC)', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax1);
ylabel('Depth (m)', 'FontSize', 6, 'FontWeight', 'bold');

% add 1st floating axis for the second parameter (chlorophyll) plotted
[hl2,ax2,ax3] = floatAxisX(Chlor_real7(5497:5548,:),D7_int(5497:5548, :),'g.', 'microg/L');
set(hl2, 'Color', 'g', 'Marker', '.','MarkerSize', 6, 'LineStyle', '--');
set(ax2,'ydir','reverse', 'XColor', 'green');
xlabel('chlorophyl microg/L', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g', 'Parent', ax3);

% add 2nd floating axis for the third parameter (density) plotted
[hl3,ax4,ax5] = floatAxisX(SigT7_int(5497:5548,:),D7_int(5497:5548,:),'b.','\sigma_{\theta} (kg/m^{3})');
set(hl3, 'Color', 'b', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax4,'ydir','reverse', 'XColor', 'b');
xlabel('\color{blue}\sigma_{\theta} (kg/m^{3})', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax5);

% add 3rd floating axis for the forth parameter (Glider backscatter) plotted
[hl4, ax6, ax7] = floatAxisX(avgGliderAZFP67, Glider_AZFP.fr67.Depth, 'k.', '[dB]');
set(hl4, 'Color', 'k', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax6, 'ydir', 'reverse', 'XColor', 'k');
xlabel('Glider Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Parent', ax7)

%add 4th floating axis for the fifth parameter (NOAA backscatter) plotted
[hl5, ax8, ax9] = floatAxisX(NOAA_AZFP.fr70.Sv(928:965), NOAA_AZFP.fr70.Depth(928:965));
set(hl5, 'Color', 'magenta', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax8, 'ydir', 'reverse', 'XColor', 'magenta');
xlabel('NOAA Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'magenta', 'Parent', ax9')

all_axes = findobj(gcf, 'type', 'axes');
set(all_axes, 'FontSize', 12, 'FontWeight', 'bold');

set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);

%%
figure(2)

plot(NOAA_AZFP.fr70.Sv(928:965), NOAA_AZFP.fr70.Depth(928:965),'Color', 'magenta', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
ax1 = gca;
set(ax1, 'YDir', 'reverse', 'XAxisLocation', 'bottom','XColor', 'magenta');
xlabel('NOAA Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'magenta', 'Parent', ax1)
ylabel('Depth (m)', 'FontSize', 6, 'FontWeight', 'bold');
xlim([-100 -65])
ylim([0 52])


% add 1st floating axis for the second parameter (chlorophyll) plotted
[hl2,ax2,ax3] = floatAxisX(Chlor_real7(5497:5548,:),D7_int(5497:5548, :),'g.', 'microg/L');
set(hl2, 'Color', 'g', 'Marker', '.','MarkerSize', 6, 'LineStyle', '--');
set(ax2,'ydir','reverse', 'XColor', 'green');
xlabel('chlorophyl microg/L', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g', 'Parent', ax3);

% add 2nd floating axis for the third parameter (density) plotted
[hl3,ax4,ax5] = floatAxisX(SigT7_int(5497:5548,:),D7_int(5497:5548,:),'b.','\sigma_{\theta} (kg/m^{3})');
set(hl3, 'Color', 'b', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax4,'ydir','reverse', 'XColor', 'b');
xlabel('\color{blue}\sigma_{\theta} (kg/m^{3})', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax5);

% add 3rd floating axis for the forth parameter (Glider backscatter) plotted
[hl4, ax6, ax7] = floatAxisX(avgGliderAZFP67, Glider_AZFP.fr67.Depth, 'k.', '[dB]');
set(hl4, 'Color', 'k', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax6, 'ydir', 'reverse', 'XColor', 'k', 'XLim',[-100 -65]);
xlabel('Glider Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Parent', ax7);
xlim([-100 -65])



%add 4th floating axis for the fifth parameter (NOAA backscatter) plotted   
[hl5, ax8, ax9] = floatAxisX(T7_int(5497:5548,:), D7_int(5497:5548,:));
set(hl5, 'Color', 'r', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax8, 'ydir','reverse', 'XColor', 'r');
xlabel('\color{red}Temperature (\circC)', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'Parent', ax9);


all_axes = findobj(gcf, 'type', 'axes');
set(all_axes, 'FontSize', 12, 'FontWeight', 'bold');

set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);

%%

figure(3)

plot(avgNOAA_70(1:43), NOAA_Depth70(1:43, 51),'Color', 'magenta', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
ax1 = gca;
set(ax1, 'YDir', 'reverse', 'XAxisLocation', 'bottom','XColor', 'magenta');
xlabel('NOAA Ship Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'magenta', 'Parent', ax1)
ylabel('Depth (m)', 'FontSize', 6, 'FontWeight', 'bold');
xlim([-100 -65])
ylim([0 52])


% add 1st floating axis for the second parameter (chlorophyll) plotted
[hl2,ax2,ax3] = floatAxisX(Chlor_real7(5497:5548,:),D7_int(5497:5548, :),'g.', 'microg/L');
set(hl2, 'Color', 'g', 'Marker', '.','MarkerSize', 6, 'LineStyle', '--');
set(ax2,'ydir','reverse', 'XColor', 'green');
xlabel('chlorophyl microg/L', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g', 'Parent', ax3);

% add 2nd floating axis for the third parameter (density) plotted
[hl3,ax4,ax5] = floatAxisX(avgSigT7,depthBins2,'b.','\sigma_{\theta} (kg/m^{3})');
set(hl3, 'Color', 'b', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax4,'ydir','reverse', 'XColor', 'b');
xlabel('\color{blue}\sigma_{\theta} (kg/m^{3})', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax5);

% add 3rd floating axis for the forth parameter (Glider backscatter) plotted
[hl4, ax6, ax7] = floatAxisX(avgGliderAZFP67, Glider_AZFP.fr67.Depth, 'k.', '[dB]');
set(hl4, 'Color', 'k', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax6, 'ydir', 'reverse', 'XColor', 'k', 'XLim',[-100 -65]);
xlabel('Glider Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Parent', ax7);
xlim([-100 -65])



%add 4th floating axis for the fifth parameter (NOAA backscatter) plotted   
[hl5, ax8, ax9] = floatAxisX(T7_int(5497:5548,:), D7_int(5497:5548,:),'r.');
set(hl5, 'Color', 'r', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax8, 'ydir','reverse', 'XColor', 'r');
xlabel('\color{red}Temperature (\circC)', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'Parent', ax9);


all_axes = findobj(gcf, 'type', 'axes');
set(all_axes, 'FontSize', 12, 'FontWeight', 'bold');

set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);
%%

figure(3)

plot(avgNOAA_70(1:43), NOAA_Depth70(1:43, 51),'Color', 'magenta', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
ax1 = gca;
set(ax1, 'YDir', 'reverse', 'XAxisLocation', 'bottom','XColor', 'magenta');
xlabel('NOAA Ship Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'magenta', 'Parent', ax1)
ylabel('Depth (m)', 'FontSize', 6, 'FontWeight', 'bold');
xlim([-100 -65])
ylim([0 52])


% add 1st floating axis for the second parameter (chlorophyll) plotted
[hl2,ax2,ax3] = floatAxisX(avgChlor7,depthBins3,'g.', 'microg/L');
set(hl2, 'Color', 'g', 'Marker', '.','MarkerSize', 6, 'LineStyle', '--');
set(ax2,'ydir','reverse', 'XColor', 'green');
xlabel('Chlorophyl Microg/L', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g', 'Parent', ax3);

% add 2nd floating axis for the third parameter (density) plotted
[hl3,ax4,ax5] = floatAxisX(avgSigT7,depthBins2,'c','\sigma_{\theta} (kg/m^{3})');
set(hl3, 'Color', 'c', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax4,'ydir','reverse', 'XColor', 'c');
xlabel('\color{cyan}\sigma_{\theta} (kg/m^{3})', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'c', 'Parent', ax5);

% add 3rd floating axis for the forth parameter (Glider backscatter) plotted
[hl4, ax6, ax7] = floatAxisX(model, DepthGrid, 'k.', '[dB]');
set(hl4, 'Color', 'k', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax6, 'ydir', 'reverse', 'XColor', 'k', 'XLim',[-100 -65]);
xlabel('Glider Acoustic Backscatter [dB] adjusted', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Parent', ax7);
xlim([-100 -65])



%add 4th floating axis for the fifth parameter (NOAA backscatter) plotted   
[hl5, ax8, ax9] = floatAxisX(avgT7, depthBins,'r.');
set(hl5, 'Color', 'r', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax8, 'ydir','reverse', 'XColor', 'r');
xlabel('\color{red}Temperature (\circC)', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'Parent', ax9);

%add 5th floating axis for the fifth parameter (Glider backscatter) plotted   
[hl6, ax10, ax11] = floatAxisX(avgGliderAZFP67, Glider_AZFP.fr67.Depth, 'b', '[dB]');
set(hl6, 'Color', 'b', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax10, 'ydir','reverse', 'XColor', 'b');
xlabel('Glider Acoustic Backscatter [dB] raw', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax11);
xlim([-100 -65])



all_axes = findobj(gcf, 'type', 'axes');
set(all_axes, 'FontSize', 12, 'FontWeight', 'bold');

set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);
%%

figure(4)

plot(avgNOAA_120(1:43), NOAA_Depth120(1:43, 51),'Color', 'magenta', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
ax1 = gca;
set(ax1, 'YDir', 'reverse', 'XAxisLocation', 'bottom','XColor', 'magenta');
xlabel('NOAA Ship Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'magenta', 'Parent', ax1)
ylabel('Depth (m)', 'FontSize', 6, 'FontWeight', 'bold');
xlim([-100 -65])
ylim([0 52])


% add 1st floating axis for the second parameter (chlorophyll) plotted
[hl2,ax2,ax3] = floatAxisX(avgChlor7,depthBins3,'g.', 'microg/L');
set(hl2, 'Color', 'g', 'Marker', '.','MarkerSize', 6, 'LineStyle', '--');
set(ax2,'ydir','reverse', 'XColor', 'green');
xlabel('Chlorophyl Microg/L', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g', 'Parent', ax3);

% add 2nd floating axis for the third parameter (density) plotted
[hl3,ax4,ax5] = floatAxisX(avgSigT7,depthBins2,'c','\sigma_{\theta} (kg/m^{3})');
set(hl3, 'Color', 'c', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax4,'ydir','reverse', 'XColor', 'c');
xlabel('\color{cyan}\sigma_{\theta} (kg/m^{3})', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'c', 'Parent', ax5);

% add 3rd floating axis for the forth parameter (Glider backscatter) plotted
[hl4, ax6, ax7] = floatAxisX(model, DepthGrid, 'k.', '[dB]');
set(hl4, 'Color', 'k', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax6, 'ydir', 'reverse', 'XColor', 'k', 'XLim',[-100 -65]);
xlabel('Glider Acoustic Backscatter [dB] adjusted', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Parent', ax7);
xlim([-100 -65])



%add 4th floating axis for the fifth parameter (NOAA backscatter) plotted   
[hl5, ax8, ax9] = floatAxisX(avgT7, depthBins1,'r.');
set(hl5, 'Color', 'r', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax8, 'ydir','reverse', 'XColor', 'r');
xlabel('\color{red}Temperature (\circC)', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'Parent', ax9);

%add 5th floating axis for the fifth parameter (Glider backscatter) plotted   
[hl6, ax10, ax11] = floatAxisX(avgGliderAZFP120, Glider_AZFP.fr120.Depth, 'b', '[dB]');
set(hl6, 'Color', 'b', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax10, 'ydir','reverse', 'XColor', 'b');
xlabel('Glider Acoustic Backscatter [dB] raw', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax11);
xlim([-100 -65])



all_axes = findobj(gcf, 'type', 'axes');
set(all_axes, 'FontSize', 12, 'FontWeight', 'bold');

set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);

%%


figure(5)

plot(avgNOAA_200(1:43), NOAA_Depth200(1:43, 51),'Color', 'magenta', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
ax1 = gca;
set(ax1, 'YDir', 'reverse', 'XAxisLocation', 'bottom','XColor', 'magenta');
xlabel('NOAA Ship Acoustic Backscatter [dB]', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'magenta', 'Parent', ax1)
ylabel('Depth (m)', 'FontSize', 6, 'FontWeight', 'bold');
xlim([-100 -65])
ylim([0 52])


% add 1st floating axis for the second parameter (chlorophyll) plotted
[hl2,ax2,ax3] = floatAxisX(avgChlor7,depthBins3,'g.', 'microg/L');
set(hl2, 'Color', 'g', 'Marker', '.','MarkerSize', 6, 'LineStyle', '--');
set(ax2,'ydir','reverse', 'XColor', 'green');
xlabel('Chlorophyl Microg/L', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'g', 'Parent', ax3);

% add 2nd floating axis for the third parameter (density) plotted
[hl3,ax4,ax5] = floatAxisX(avgSigT7,depthBins2,'c','\sigma_{\theta} (kg/m^{3})');
set(hl3, 'Color', 'c', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax4,'ydir','reverse', 'XColor', 'c');
xlabel('\color{cyan}\sigma_{\theta} (kg/m^{3})', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'c', 'Parent', ax5);

% add 3rd floating axis for the forth parameter (Glider backscatter) plotted
[hl4, ax6, ax7] = floatAxisX(model, DepthGrid, 'k.', '[dB]');
set(hl4, 'Color', 'k', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax6, 'ydir', 'reverse', 'XColor', 'k', 'XLim',[-100 -65]);
xlabel('Glider Acoustic Backscatter [dB] adjusted', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Parent', ax7);
xlim([-100 -65])



%add 4th floating axis for the fifth parameter (NOAA backscatter) plotted   
[hl5, ax8, ax9] = floatAxisX(avgT7, depthBins1,'r.');
set(hl5, 'Color', 'r', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax8, 'ydir','reverse', 'XColor', 'r');
xlabel('\color{red}Temperature (\circC)', ...
    'FontSize', 12, 'FontWeight', 'bold', 'Color', 'r', 'Parent', ax9);

%add 5th floating axis for the fifth parameter (Glider backscatter) plotted   
[hl6, ax10, ax11] = floatAxisX(avgGliderAZFP200, Glider_AZFP.fr200.Depth, 'b', '[dB]');
set(hl6, 'Color', 'b', 'Marker', '.', 'MarkerSize', 6, 'LineStyle', '-.');
set(ax10, 'ydir','reverse', 'XColor', 'b');
xlabel('Glider Acoustic Backscatter [dB] raw', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'b', 'Parent', ax11);
xlim([-100 -65])



all_axes = findobj(gcf, 'type', 'axes');
set(all_axes, 'FontSize', 12, 'FontWeight', 'bold');

set(gcf, 'PaperPosition', [0.25 2.5 8 6], 'PaperSize', [8.5 11], 'Position', [270 100 1000 957]);