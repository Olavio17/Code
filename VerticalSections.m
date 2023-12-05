% clearvars

% Load glider data (real-time processed)
Data = load('NH_202205201936_osu592.mat');

% Calculate Depth in meters from Pressure in dB and add it to the existing
% structure
Data.Depth_gl = sw_dpth(Data.Press*10, mean(Data.Lat(~isnan(Data.Lat))));

% % Interpolate GPS variables Lon and Lat for now
Data.Lon_int      = interp1(Data.Timeinsec(~isnan(Data.Lon)),      Data.Lon(~isnan(Data.Lon)), Data.Timeinsec);
Data.Lat_int      = interp1(Data.Timeinsec(~isnan(Data.Lat)),      Data.Lat(~isnan(Data.Lat)), Data.Timeinsec);

% Find all indexes where GPS is not NaN
ind_Lat_not_nan = find(~isnan(Data.Lat_int));
ind_Lon_not_nan = find(~isnan(Data.Lon_int));

% Split glider track to lines by Longitude, define start and end of lines
Ln = get_min_max(Data.Lon_int(ind_Lon_not_nan), 0.1);

% Lets select line 1 to create gridded data as an example
line_No=1;
ind_ln1 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 2 to create gridded data as an example
line_No=2;
ind_ln2 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 3 to create gridded data as an example
line_No=3;
ind_ln3 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 4 to create gridded data as an example
line_No=4;
ind_ln4 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 5 to create gridded data as an example
line_No=5;
ind_ln5 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 6 to create gridded data as an example
line_No=6;
ind_ln6 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 7 to create gridded data as an example
line_No=7;
ind_ln7 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 8 to create gridded data as an example
line_No=8;
ind_ln8 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 9 to create gridded data as an example
line_No=9;
ind_ln9 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Lets select line 10 to create gridded data as an example
line_No=10;
ind_ln10 = ind_Lon_not_nan(Ln(line_No)):ind_Lon_not_nan(Ln(line_No+1));

% Create new variables for selected lines

Lon_ln1 = Data.Lon_int(ind_ln1);
Lon_ln2 = Data.Lon_int(ind_ln2);
Lon_ln3 = Data.Lon_int(ind_ln3);
Lon_ln4 = Data.Lon_int(ind_ln4);
Lon_ln5 = Data.Lon_int(ind_ln5);
Lon_ln6 = Data.Lon_int(ind_ln6);
Lon_ln7 = Data.Lon_int(ind_ln7);
Lon_ln8 = Data.Lon_int(ind_ln8);
Lon_ln9 = Data.Lon_int(ind_ln9);
Lon_ln10 = Data.Lon_int(ind_ln10);

Lat_ln1 = Data.Lat_int(ind_ln1);
Lat_ln2 = Data.Lat_int(ind_ln2);
Lat_ln3 = Data.Lat_int(ind_ln3);
Lat_ln4 = Data.Lat_int(ind_ln4);
Lat_ln5 = Data.Lat_int(ind_ln5);
Lat_ln6 = Data.Lat_int(ind_ln6);
Lat_ln7 = Data.Lat_int(ind_ln7);
Lat_ln8 = Data.Lat_int(ind_ln8);
Lat_ln9 = Data.Lat_int(ind_ln9);
Lat_ln10 = Data.Lat_int(ind_ln10);


Depth_gl1 = Data.Depth_gl(ind_ln1);
Depth_gl2 = Data.Depth_gl(ind_ln2);
Depth_gl3 = Data.Depth_gl(ind_ln3);
Depth_gl4 = Data.Depth_gl(ind_ln4);
Depth_gl5 = Data.Depth_gl(ind_ln5);
Depth_gl6 = Data.Depth_gl(ind_ln6);
Depth_gl7 = Data.Depth_gl(ind_ln7);
Depth_gl8 = Data.Depth_gl(ind_ln8);
Depth_gl9 = Data.Depth_gl(ind_ln9);
Depth_gl10 = Data.Depth_gl(ind_ln10);

Temp1 = Data.Temp(ind_ln1);
Temp2 = Data.Temp(ind_ln2);
Temp3 = Data.Temp(ind_ln3);
Temp4 = Data.Temp(ind_ln4);
Temp5 = Data.Temp(ind_ln5);
Temp6 = Data.Temp(ind_ln6);
Temp7 = Data.Temp(ind_ln7);
Temp8 = Data.Temp(ind_ln8);
Temp9 = Data.Temp(ind_ln9);
Temp10 = Data.Temp(ind_ln10);

Chlor1 = Data.Chlor(ind_ln1);
Chlor2 = Data.Chlor(ind_ln2);
Chlor3 = Data.Chlor(ind_ln3);
Chlor4 = Data.Chlor(ind_ln4);
Chlor5 = Data.Chlor(ind_ln5);
Chlor6 = Data.Chlor(ind_ln6);
Chlor7 = Data.Chlor(ind_ln7);
Chlor8 = Data.Chlor(ind_ln8);
Chlor9 = Data.Chlor(ind_ln9);
Chlor10 = Data.Chlor(ind_ln10);

Cdom1 = Data.Cdom(ind_ln1);
Cdom2 = Data.Cdom(ind_ln2);
Cdom3 = Data.Cdom(ind_ln3);
Cdom4 = Data.Cdom(ind_ln4);
Cdom5 = Data.Cdom(ind_ln5);
Cdom6 = Data.Cdom(ind_ln6);
Cdom7 = Data.Cdom(ind_ln7);
Cdom8 = Data.Cdom(ind_ln8);
Cdom9 = Data.Cdom(ind_ln9);
Cdom10 = Data.Cdom(ind_ln10);


BackScatter1 = Data.BackScatter(ind_ln1);
BackScatter2 = Data.BackScatter(ind_ln2);
BackScatter3 = Data.BackScatter(ind_ln3);
BackScatter4 = Data.BackScatter(ind_ln4);
BackScatter5 = Data.BackScatter(ind_ln5);
BackScatter6 = Data.BackScatter(ind_ln6);
BackScatter7 = Data.BackScatter(ind_ln7);
BackScatter8 = Data.BackScatter(ind_ln8);
BackScatter9 = Data.BackScatter(ind_ln9);
BackScatter10 = Data.BackScatter(ind_ln10);

Oxygen1 = Data.Oxygen(ind_ln1);
Oxygen2 = Data.Oxygen(ind_ln2);
Oxygen3 = Data.Oxygen(ind_ln3);
Oxygen4 = Data.Oxygen(ind_ln4);
Oxygen5 = Data.Oxygen(ind_ln5);
Oxygen6 = Data.Oxygen(ind_ln6);
Oxygen7 = Data.Oxygen(ind_ln7);
Oxygen8 = Data.Oxygen(ind_ln8);
Oxygen9 = Data.Oxygen(ind_ln9);
Oxygen10 = Data.Oxygen(ind_ln10);

% Allocate memory for Distance array
Dist1(1:length(Lon_ln1))=0;
% Allocate memory for Distance array
Dist2(1:length(Lon_ln2))=0;
% Allocate memory for Distance array
Dist3(1:length(Lon_ln3))=0;
% Allocate memory for Distance array
Dist4(1:length(Lon_ln4))=0;
% Allocate memory for Distance array
Dist5(1:length(Lon_ln5))=0;
% Allocate memory for Distance array
Dist6(1:length(Lon_ln6))=0;
% Allocate memory for Distance array
Dist7(1:length(Lon_ln7))=0;
% Allocate memory for Distance array
Dist8(1:length(Lon_ln8))=0;
% Allocate memory for Distance array
Dist9(1:length(Lon_ln9))=0;
% Allocate memory for Distance array
Dist10(1:length(Lon_ln10))=0;

% Calculate distance from Longitude1
Lat_start1=Lat_ln1(1);
Lon_start1=Lon_ln1(1);

for k = 1:length(Lat_ln1)
    Dist1(k) = sw_dist([Lat_start1,Lat_ln1(k)],[Lon_start1,Lon_ln1(k)],'km');
end

% Calculate distance from Longitude2
Lat_start2=Lat_ln2(1);
Lon_start2=Lon_ln2(1);

for k = 1:length(Lat_ln2)
    Dist2(k) = sw_dist([Lat_start2,Lat_ln2(k)],[Lon_start2,Lon_ln2(k)],'km');
end

% Calculate distance from Longitude3
Lat_start3=Lat_ln3(1);
Lon_start3=Lon_ln3(1);

for k = 1:length(Lat_ln3)
    Dist3(k) = sw_dist([Lat_start3,Lat_ln3(k)],[Lon_start3,Lon_ln3(k)],'km');
end

% Calculate distance from Longitude4
Lat_start4=Lat_ln4(1);
Lon_start4=Lon_ln4(1);

for k = 1:length(Lat_ln4)
    Dist4(k) = sw_dist([Lat_start4,Lat_ln4(k)],[Lon_start4,Lon_ln4(k)],'km');
end

% Calculate distance from Longitude5
Lat_start5=Lat_ln5(1);
Lon_start5=Lon_ln5(1);

for k = 1:length(Lat_ln5)
    Dist5(k) = sw_dist([Lat_start5,Lat_ln5(k)],[Lon_start5,Lon_ln5(k)],'km');
end

% Calculate distance from Longitude6
Lat_start6=Lat_ln6(1);
Lon_start6=Lon_ln6(1);

for k = 1:length(Lat_ln6)
    Dist6(k) = sw_dist([Lat_start6,Lat_ln6(k)],[Lon_start6,Lon_ln6(k)],'km');
end

% Calculate distance from Longitude7
Lat_start7=Lat_ln7(1);
Lon_start7=Lon_ln7(1);

for k = 1:length(Lat_ln7)
    Dist7(k) = sw_dist([Lat_start7,Lat_ln7(k)],[Lon_start7,Lon_ln7(k)],'km');
end

% Calculate distance from Longitude8
Lat_start8=Lat_ln8(1);
Lon_start8=Lon_ln8(1);

for k = 1:length(Lat_ln8)
    Dist8(k) = sw_dist([Lat_start8,Lat_ln8(k)],[Lon_start8,Lon_ln8(k)],'km');
end

% Calculate distance from Longitude9
Lat_start9=Lat_ln9(1);
Lon_start9=Lon_ln9(1);

for k = 1:length(Lat_ln9)
    Dist9(k) = sw_dist([Lat_start9,Lat_ln9(k)],[Lon_start9,Lon_ln9(k)],'km');
end

% Calculate distance from Longitude10
Lat_start10=Lat_ln10(1);
Lon_start10=Lon_ln10(1);

for k = 1:length(Lat_ln10)
    Dist10(k) = sw_dist([Lat_start10,Lat_ln10(k)],[Lon_start10,Lon_ln10(k)],'km');
end
%======================================================================
% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln1,Lat_ln1,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 1 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln2,Lat_ln2,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 2 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln3,Lat_ln3,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 3 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln4,Lat_ln4,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 4 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure 
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln5,Lat_ln5,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 5 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln6,Lat_ln6,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 6 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln7,Lat_ln7,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 7 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln8,Lat_ln8,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 8 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln9,Lat_ln9,'r.-')
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
title("Line 9 track")
box on;
set(gcf,'Position',[200,100,850,650]);

%======================================================================

% plot glider tracks and show what line we selected in different color
figure
plot(Data.Lon(~isnan(Data.Lon)),Data.Lat(~isnan(Data.Lon)),'b.-')
hold on
plot(Lon_ln10,Lat_ln10,'r.-')
title("Line 10 track")
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
ylabel('Latitude', 'FontSize',12, 'FontWeight','bold')    % y axis label
box on;
set(gcf,'Position',[200,100,850,650]);

%%

% Create gridded matrix for Temperature field

Dp_inc1 = 1; % Depth grid increment
Ds_inc1 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid1 = 1:Ds_inc1:20; % 20km
Y_grid1 = 1:Dp_inc1:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid1 = NaN(length(X_grid1), length(Y_grid1));

% Find Temperature data which fall inside each cell of the grid and
% calculate averaged Temperature value for that cell
for DS1 = 1:length(X_grid1)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS1 = find( Dist1 >= X_grid1(DS1) & Dist1 < X_grid1(DS1+1));
    if( ~isempty(i_DS1)) % if data found constrain it by Depth cell
        tmp1 = Temp1(i_DS1);
        for DP1 = 1:length(Y_grid1)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP1 = find(Depth_gl1(i_DS1) >= Y_grid1(DP1) & Depth_gl1(i_DS1) < Y_grid1(DP1+1)); 

            if(~isempty(i_DP1)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid  
                tmp=tmp1(i_DP1);
                Temp_grid1(DS1,DP1) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid1=transpose(Temp_grid1); % Transpose Temperaturre grid for plotting
%======================================================================

% Create gridded matrix for Temperature field

Dp_inc2 = 1; % Depth grid increment
Ds_inc2 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid2 = 1:Ds_inc2:20; % 20km
Y_grid2 = 1:Dp_inc2:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid2 = NaN(length(X_grid2), length(Y_grid2));
for DS2 = 1:length(X_grid2)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS2 = find( Dist2 >= X_grid2(DS2) & Dist2 < X_grid2(DS2+1));
    if( ~isempty(i_DS2)) % if data found constrain it by Depth cell
        tmp1 = Temp2(i_DS2);
        for DP2 = 1:length(Y_grid2)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP2 = find(Depth_gl2(i_DS2) >= Y_grid2(DP2) & Depth_gl2(i_DS2) < Y_grid2(DP2+1)); 

            if(~isempty(i_DP2)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP2);
                Temp_grid2(DS2,DP2) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid2=transpose(Temp_grid2); % Transpose Temperaturre grid for plotting

%=======================================================================
% Create gridded matrix for Temperature field

Dp_inc3 = 1; % Depth grid increment
Ds_inc3 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid3 = 1:Ds_inc3:20; % 20km
Y_grid3 = 1:Dp_inc3:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid3 = NaN(length(X_grid3), length(Y_grid3));
for DS3 = 1:length(X_grid3)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS3 = find( Dist3 >= X_grid3(DS3) & Dist3 < X_grid3(DS3+1));
    if( ~isempty(i_DS3)) % if data found constrain it by Depth cell
        tmp1 = Temp3(i_DS3);
        for DP3 = 1:length(Y_grid3)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP3 = find(Depth_gl3(i_DS3) >= Y_grid3(DP3) & Depth_gl3(i_DS3) < Y_grid3(DP3+1)); 

            if(~isempty(i_DP3)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP3);
                Temp_grid3(DS3,DP3) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid3=transpose(Temp_grid3); % Transpose Temperaturre grid for plotting

%========================================================================
% Create gridded matrix for Temperature field

Dp_inc4 = 1; % Depth grid increment
Ds_inc4 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid4 = 1:Ds_inc4:20; % 20km
Y_grid4 = 1:Dp_inc4:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid4 = NaN(length(X_grid4), length(Y_grid4));
for DS4 = 1:length(X_grid4)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS4 = find( Dist4 >= X_grid4(DS4) & Dist4 < X_grid4(DS4+1));
    if( ~isempty(i_DS4)) % if data found constrain it by Depth cell
        tmp1 = Temp4(i_DS4);
        for DP4 = 1:length(Y_grid4)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP4 = find(Depth_gl4(i_DS4) >= Y_grid4(DP4) & Depth_gl4(i_DS4) < Y_grid4(DP4+1)); 

            if(~isempty(i_DP4)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP4);
                Temp_grid4(DS4,DP4) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid4=transpose(Temp_grid4); % Transpose Temperaturre grid for plotting

%========================================================================
% Create gridded matrix for Temperature field

Dp_inc5 = 1; % Depth grid increment
Ds_inc5 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid5 = 1:Ds_inc5:20; % 20km
Y_grid5 = 1:Dp_inc5:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid5 = NaN(length(X_grid5), length(Y_grid5));
for DS5 = 1:length(X_grid5)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS5 = find( Dist5 >= X_grid5(DS5) & Dist5 < X_grid5(DS5+1));
    if( ~isempty(i_DS5)) % if data found constrain it by Depth cell
        tmp1 = Temp5(i_DS5);
        for DP5 = 1:length(Y_grid5)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP5 = find(Depth_gl5(i_DS5) >= Y_grid5(DP5) & Depth_gl5(i_DS5) < Y_grid5(DP5+1)); 

            if(~isempty(i_DP5)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP5);
                Temp_grid5(DS5,DP5) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid5=transpose(Temp_grid5); % Transpose Temperaturre grid for plotting

%========================================================================
% Create gridded matrix for Temperature field

Dp_inc6 = 1; % Depth grid increment
Ds_inc6 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid6 = 1:Ds_inc6:20; % 20km
Y_grid6 = 1:Dp_inc6:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid6 = NaN(length(X_grid6), length(Y_grid6));
for DS6 = 1:length(X_grid6)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS6 = find( Dist6 >= X_grid6(DS6) & Dist6 < X_grid6(DS6+1));
    if( ~isempty(i_DS6)) % if data found constrain it by Depth cell
        tmp1 = Temp6(i_DS6);
        for DP6 = 1:length(Y_grid6)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP6 = find(Depth_gl6(i_DS6) >= Y_grid6(DP6) & Depth_gl6(i_DS6) < Y_grid6(DP6+1)); 

            if(~isempty(i_DP6)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP6);
                Temp_grid6(DS6,DP6) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid6=transpose(Temp_grid6); % Transpose Temperaturre grid for plotting

%========================================================================
% Create gridded matrix for Temperature field

Dp_inc7 = 1; % Depth grid increment
Ds_inc7 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid7 = 1:Ds_inc7:20; % 20km
Y_grid7 = 1:Dp_inc7:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid7 = NaN(length(X_grid7), length(Y_grid7));
for DS7 = 1:length(X_grid7)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS7 = find( Dist7 >= X_grid7(DS7) & Dist7 < X_grid7(DS7+1));
    if( ~isempty(i_DS7)) % if data found constrain it by Depth cell
        tmp1 = Temp7(i_DS7);
        for DP7 = 1:length(Y_grid7)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP7 = find(Depth_gl7(i_DS7) >= Y_grid7(DP7) & Depth_gl7(i_DS7) < Y_grid7(DP7+1)); 

            if(~isempty(i_DP7)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP7);
                Temp_grid7(DS7,DP7) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid7=transpose(Temp_grid7); % Transpose Temperaturre grid for plotting

%=========================================================================
% Create gridded matrix for Temperature field

Dp_inc8 = 1; % Depth grid increment
Ds_inc8 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid8 = 1:Ds_inc8:20; % 20km
Y_grid8 = 1:Dp_inc8:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid8 = NaN(length(X_grid8), length(Y_grid8));
for DS8 = 1:length(X_grid8)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS8 = find( Dist8 >= X_grid8(DS8) & Dist8 < X_grid8(DS8+1));
    if( ~isempty(i_DS8)) % if data found constrain it by Depth cell
        tmp1 = Temp8(i_DS8);
        for DP8 = 1:length(Y_grid8)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP8 = find(Depth_gl8(i_DS8) >= Y_grid8(DP8) & Depth_gl8(i_DS8) < Y_grid8(DP8+1)); 

            if(~isempty(i_DP8)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP8);
                Temp_grid8(DS8,DP8) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid8=transpose(Temp_grid8); % Transpose Temperaturre grid for plotting

%=========================================================================
% Create gridded matrix for Temperature field

Dp_inc9 = 1; % Depth grid increment
Ds_inc9 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid9 = 1:Ds_inc9:20; % 20km
Y_grid9 = 1:Dp_inc9:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid9 = NaN(length(X_grid9), length(Y_grid9));
for DS9 = 1:length(X_grid9)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS9 = find( Dist9 >= X_grid9(DS9) & Dist9 < X_grid9(DS9+1));
    if( ~isempty(i_DS9)) % if data found constrain it by Depth cell
        tmp1 = Temp9(i_DS9);
        for DP9 = 1:length(Y_grid9)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP9 = find(Depth_gl9(i_DS9) >= Y_grid9(DP9) & Depth_gl9(i_DS9) < Y_grid9(DP9+1)); 

            if(~isempty(i_DP9)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP9);
                Temp_grid9(DS9,DP9) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid9=transpose(Temp_grid9); % Transpose Temperaturre grid for plotting

%=========================================================================
% Create gridded matrix for Temperature field

Dp_inc10 = 1; % Depth grid increment
Ds_inc10 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid10 = 1:Ds_inc10:20; % 20km
Y_grid10 = 1:Dp_inc10:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Temp_grid10 = NaN(length(X_grid10), length(Y_grid10));
% Find Temperature data which fall inside each cell of the grid and
% calculate averaged Temperature value for that cell
for DS10 = 1:length(X_grid10)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS10 = find( Dist10 >= X_grid10(DS10) & Dist10 < X_grid10(DS10+1));
    if( ~isempty(i_DS10)) % if data found constrain it by Depth cell
        tmp1 = Temp10(i_DS10);
        for DP10 = 1:length(Y_grid10)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP10 = find(Depth_gl10(i_DS10) >= Y_grid10(DP10) & Depth_gl10(i_DS10) < Y_grid10(DP10+1)); 

            if(~isempty(i_DP10)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                tmp=tmp1(i_DP10);
                Temp_grid10(DS10,DP10) = mean(tmp(~isnan(tmp)));
            end
        end
    end
end
Temp_grid10=transpose(Temp_grid10); % Transpose Temperaturre grid for plotting




% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln1,Depth_gl1,10, Temp1,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln1) max(Lon_ln1)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist1,Depth_gl1,10, Temp1,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist1(1) Dist1(length(Dist1))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln1(1) - Lon_ln1(length(Lon_ln1)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid1, Y_grid1, Temp_grid1); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%==============================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln2,Depth_gl2,10, Temp2,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln2) max(Lon_ln2)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist2,Depth_gl2,10, Temp2,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist2(1) Dist2(length(Dist2))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln2(1) - Lon_ln2(length(Lon_ln2)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid2, Y_grid2, Temp_grid2); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%======================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln3,Depth_gl3,10, Temp3,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln3) max(Lon_ln3)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist3,Depth_gl3,10, Temp3,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist3(1) Dist3(length(Dist3))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln3(1) - Lon_ln3(length(Lon_ln3)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid3, Y_grid3, Temp_grid3); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%======================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln4,Depth_gl4,10, Temp4,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln4) max(Lon_ln4)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist4,Depth_gl4,10, Temp4,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist4(1) Dist4(length(Dist4))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln4(1) - Lon_ln4(length(Lon_ln4)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid4, Y_grid4, Temp_grid4); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%====================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln5,Depth_gl5,10, Temp5,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln5) max(Lon_ln5)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist5,Depth_gl5,10, Temp5,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist5(1) Dist5(length(Dist5))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln5(1) - Lon_ln5(length(Lon_ln5)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid5, Y_grid5, Temp_grid5); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%==================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln6,Depth_gl6,10, Temp6,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln6) max(Lon_ln6)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist6,Depth_gl6,10, Temp6,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist6(1) Dist6(length(Dist6))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln6(1) - Lon_ln6(length(Lon_ln6)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid6, Y_grid6, Temp_grid6); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%===================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln7,Depth_gl7,10, Temp7,'filled', 'SizeData', 50)
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln7) max(Lon_ln7)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist7,Depth_gl7,10, Temp7,'filled', 'SizeData', 50)
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist7(1) Dist7(length(Dist7))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln7(1) - Lon_ln7(length(Lon_ln7)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid7, Y_grid7, Temp_grid7); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%=====================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln8,Depth_gl8,10, Temp8,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln8) max(Lon_ln8)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist8,Depth_gl8,10, Temp8,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist8(1) Dist8(length(Dist8))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln8(1) - Lon_ln8(length(Lon_ln8)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid8, Y_grid8, Temp_grid8); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%=====================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln9,Depth_gl9,10, Temp9,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln9) max(Lon_ln9)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist9,Depth_gl9,10, Temp9,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist9(1) Dist9(length(Dist9))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln9(1) - Lon_ln9(length(Lon_ln9)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid9, Y_grid9, Temp_grid9); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%========================================================================

% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln10,Depth_gl10,10, Temp10,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln10) max(Lon_ln10)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist10,Depth_gl10,10, Temp10,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist10(1) Dist10(length(Dist10))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln10(1) - Lon_ln10(length(Lon_ln10)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid10, Y_grid10, Temp_grid10); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%========================================================================
%%
% creating gridded matrix for acoustics on both glider and ship 

% Create gridded matrix for Temperature field

Dp_inc7 = 1; % Depth grid increment
Ds_inc7 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid7 = 1:Ds_inc7:20; % 20km
Y_grid7 = 1:Dp_inc7:100; % 100m

% Allocate memory for the acoustic_grid array and set all cell to NaNs
avgGliderAZFP67_grid(1:length(X_grid7),1:length(Y_grid7)) = NaN;
for DS7 = 1:length(X_grid7)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS7 = find( Dist7 >= X_grid7(DS7) & Dist7 < X_grid7(DS7+1));
    if( ~isempty(i_DS7)) % if data found constrain it by Depth cell
        AZFP67_1 = avgGliderAZFP67(i_DS7);
        for DP7 = 1:length(Y_grid7)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP7 = find(Depth_gl7(i_DS7) >= Y_grid7(DP7) & Depth_gl7(i_DS7) < Y_grid7(DP7+1)); 

            if(~isempty(i_DP7)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                AZFP67=AZFP67_1(i_DP7);
                avgGliderAZFP67_grid(DS7,DP7) = mean(AZFP67(~isnan(AZFP67)));
            end
        end
    end
end
avgGliderAZFP67_grid=transpose(avgGliderAZFP67_grid); % Transpose Temperaturre grid for plotting

%%
% Plot Temperature crossection with 3 different methods

% Scatter plot, crossection with Longitude as X-axes
figure
set(gcf,'Position',[200,100,1250,850]);
% Top subplot
subplot(3,1,1)
scatter(Lon_ln10,Depth_gl10,10, Temp10,'filled')
clim([6 10])
colormap("jet")
cb1 = colorbar;
ylabel(cb1, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln10) max(Lon_ln10)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;

% Scatter plot, crossection with Distance as X-axes

% middle subplot
subplot(3,1,2)
scatter(Dist10,Depth_gl10,10, Temp10,'filled')
clim([6 10])
colormap("jet")
cb2 = colorbar;
ylabel(cb2, 'Temperature C');

ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', ...
        'reverse','xlim', [Dist10(1) Dist10(length(Dist10))]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

if( (Lon_ln10(1) - Lon_ln10(length(Lon_ln10)) > 0))
    % Glider was heading East-West
    set(ax1, 'xdir','reverse');
else
    % Glider was heading East-West
    set(ax1, 'xdir','normal');
end
box on

% Pcolor plot, Temperature grid, crossection with Distance as X-axes

% bottom subplot
subplot(3,1,3)
pcolor(X_grid10, Y_grid10, Temp_grid10); 
shading flat;
set(gca,'ydir','reverse','xdir','reverse');
clim([6 10])
colormap("jet")
cb3 = colorbar;
ylabel(cb3, 'Temperature C');
box on

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Distance (km)', 'FontSize',12, 'FontWeight','bold')    % x axis label

%%
% Making the chlorophyll data make sense
% Wet Labs ECO Triplet calibration coefficientns

chl_scf=0.0073;                % Chlor Scale Factor
%chl_scf=1;                % Chlor Scale Factor

chl_cwo=43;                     % Chlor Clear Water Offset
%chl_cwo=0;                     % Chlor Clear Water Offset

% Y = slope * X + offset

Chlor_real7 = (C7_int - chl_cwo) *chl_scf;

Chlor_ind = D7_int(1:end-1) - D7_int(2:end) > 5;


num_dives = sum(NOAA_ind) + 1;
NOAA_Depth70 = NaN(size(NOAA_AZFP.fr70.Depth, 1), num_dives);
currentcol = 1;
currentrow = 1;

for i = 1:size(NOAA_AZFP.fr70.Depth, 1)
    NOAA_Depth70(currentrow, currentcol) = NOAA_AZFP.fr70.Depth(i);
    
    if i < size(NOAA_AZFP.fr70.Depth, 1) && NOAA_ind(i)
        currentrow = 1;
        currentcol = currentcol + 1;
    else
        currentrow = currentrow + 1;
    end

end


%%


DataG = load('Glider_AZFP_data_Line7.mat');
DataN = load('NOAA_ship_data_Line7.mat');
%%
Lat_start0 = DataG.Glider_AZFP.fr67.Lat(1);
Lon_start0 = DataG.Glider_AZFP.fr67.Lon(1);

for k = 1:length(DataG.Glider_AZFP.fr67.Lat)
    Dist0(k) = sw_dist([Lat_start0,DataG.Glider_AZFP.fr67.Lat(k)],[Lon_start0,DataG.Glider_AZFP.fr67.Lon(k)],'km');
end
%%


% Create gridded matrix for Temperature field

Dp_inc0 = 1; % Depth grid increment
Ds_inc0 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid0 = 1:Ds_inc0:20; % 20km
Y_grid0 = 1:Dp_inc0:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Sv_grid = NaN(length(X_grid0),length(Y_grid0));

% Find Temperature data which fall inside each cell of the grid and
% calculate averaged Temperature value for that cell
for DS0 = 1:length(X_grid0)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_DS0 = find( Distance >= X_grid0(DS0) & Distance < X_grid0(DS0+1));
    if( ~isempty(i_DS0)) % if data found constrain it by Depth cell
        Sv0 = DataG.Glider_AZFP.fr67.Sv(i_DS0);
        for DP0 = 1:length(Y_grid0)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_DP0 = find(DataG.Glider_AZFP.fr67.Sv(i_DS0) >= Y_grid0(DP0) & DataG.Glider_AZFP.fr67.Sv(i_DS0) < Y_grid0(DP0+1)); 

            if(~isempty(i_DP0)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                Sv=Sv0(i_DP0);
                Sv_grid(DS0,DP0) = mean(Sv(~isnan(Sv)));
            end
        end
    end
end
Sv_grid=transpose(Sv_grid); % Transpose Temperaturre grid for plotting
%%


%Glider67_array = DataG.Glider_AZFP.fr67.Sv(:);

%Glider67_array = Glider67_array(~isnan(Glider67_array));

% Interpolate parameters with time in Jd( Julian Days)

DataG.Glider_AZFP.fr67.Lon_int = interp1(DataG.Glider_AZFP.fr67.JD(~isnan(DataG.Glider_AZFP.fr67.Lon)), DataG.Glider_AZFP.fr67.Lon(~isnan(DataG.Glider_AZFP.fr67.Lon)), DataG.Glider_AZFP.fr67.JD);
DataG.Glider_AZFP.fr67.Lat_int = interp1(DataG.Glider_AZFP.fr67.JD(~isnan(DataG.Glider_AZFP.fr67.Lat)), DataG.Glider_AZFP.fr67.Lat(~isnan(DataG.Glider_AZFP.fr67.Lat)), DataG.Glider_AZFP.fr67.JD);

% Calculate distance from Longitude

Lat_begins = DataG.Glider_AZFP.fr67.Lat_int(1);
Lon_begins = DataG.Glider_AZFP.fr67.Lon_int(1);

Distance = zeros(1,length(DataG.Glider_AZFP.fr67.Lon_int));

Distance = Distance';

for j = 1:length(DataG.Glider_AZFP.fr67.Lat_int)
    Distance(j) = sw_dist([Lat_begins, DataG.Glider_AZFP.fr67.Lat_int(j)], [Lon_begins, DataG.Glider_AZFP.fr67.Lon_int(j)], 'km');
end

AZFP_array = DataG.Glider_AZFP.fr67.Sv(:);

%%

Lon7 = Data.Lon_int(ind_ln7);

% Create gridded matrix for Temperature field

Dp_inc7 = 1; % Depth grid increment
Ds_inc7 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid7 = 1:Ds_inc7:20; % 20km
Y_grid7 = 1:Dp_inc7:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Chlor_grid7 = NaN(length(X_grid7), length(Y_grid7));
for CS7 = 1:length(X_grid7)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_CS7 = find( Dist7 >= X_grid7(DS7) & Dist7 < X_grid7(DS7+1));
    if( ~isempty(i_CS7)) % if data found constrain it by Depth cell
        chlor7 = Chlor_real7(i_CS7);
        for CP7 = 1:length(Y_grid7)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_CP7 = find(Depth_gl7(i_CS7) >= Y_grid7(CP7) & Depth_gl7(i_CS7) < Y_grid7(CP7+1)); 

            if(~isempty(i_CP7)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                chlor=chlor7(i_CP7);
                Chlor_grid7(CS7,CP7) = mean(chlor(~isnan(chlor)));
            end
        end
    end
end
Chlor_grid7=transpose(Chlor_grid7); % Transpose Temperaturre grid for plotting


% Create gridded matrix for Temperature field

Dp_inc7 = 1; % Depth grid increment
Ds_inc7 = 1; % Distance grid increment

% Create X and Y grid arrays
X_grid7 = 1:Ds_inc7:20; % 20km
Y_grid7 = 1:Dp_inc7:100; % 100m

% Allocate memory for the Temp_grid array and set all cell to NaNs
Density_grid7 = NaN(length(X_grid7), length(Y_grid7));
for SS7 = 1:length(X_grid7)-1 % this is loop along the Distance space

    % Find indexes inside the current cell for distance DS
    i_SS7 = find( Dist7 >= X_grid7(DS7) & Dist7 < X_grid7(SS7+1));
    if( ~isempty(i_SS7)) % if data found constrain it by Depth cell
        sigt7 = SigT7(i_SS7);
        for SP7 = 1:length(Y_grid7)-1 % this is loop along the Depth space
            
            % Find indexes inside the current cell for distance DP
            % !!! Important that we use only data found during Distance
            % cell evaluation (i_DS)
            i_SP7 = find(Depth_gl7(i_SS7) >= Y_grid7(SP7) & Depth_gl7(i_SS7) < Y_grid7(SP7+1)); 

            if(~isempty(i_SP7)>0 )
                % Find mean value and assign it to (DS,DP) cell of the
                % Temperature grid
                sigt=sigt7(i_SP7);
                Density_grid7(SS7,SP7) = mean(sigt(~isnan(sigt)));
            end
        end
    end
end
Density_grid7=transpose(Density_grid7); % Transpose Temperaturre grid for plotting
%%
figure
set(gcf, "Position", [100, 50, 900, 1024]);

subplot(3,1,1)
f0 = scatter(Lon_ln7,Depth_gl7,10, SigT7,'filled');
set(f0, 'SizeData', 50);
colormap("jet")
cb = colorbar;
ylabel(cb, '\sigma_{\theta} (kg/m^{3})','FontSize',12, 'FontWeight','bold');


ax1=gca;
set(ax1,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln7) max(Lon_ln7)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;
Pos1=get(ax1,'Position');

%------------------------------------------

subplot(3,1,2)
f1 = scatter(Lon_ln7,Depth_gl7,10, Chlor_real7,'filled');
set(f1, 'SizeData', 35);
clim([0 4])
colormap("jet")
cb = colorbar;
ylabel(cb, 'Chlor MicroG/L','FontSize',12, 'FontWeight','bold');


ax2=gca;
set(ax2,'YAxisLocation','left', 'ydir', 'reverse', ...
    'xlim', [min(Lon_ln7) max(Lon_ln7)]); 

ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize',12, 'FontWeight','bold')    % x axis label
box on;
Pos2=get(ax2,'Position');
%---------------------------------------------
subplot(3, 1, 3)
f2 = pcolor(DataG.Glider_AZFP.fr67.Lon_int,DataG.Glider_AZFP.fr67.Depth ,DataG.Glider_AZFP.fr67.Sv); shading flat;

colormap jet;
ylabel('Depth range, (m)');
xlabel('Longitude');
cb67=colorbar('FontSize',10);
cb67.Label.String = ['Volume backscattering strength'; '67 kHz, (Sv re 1 m-1) [dB]    '];
clim(Eco_lim);
hold on;
plot(Gl.Lon_int(istart:iend), Gl.Bottom_depth_int(istart:iend),'k-','linewidth',2, 'markersize',6);

ax3=gca;
set(ax3,'YColor',[0.0 0.0 0.0],'YAxisLocation','left', 'ydir','reverse', 'xlim', xlim, 'ylim', [0 ymax]);
set(ax3,'XTickLabel',' ', 'Ylim', [0 ymax], 'YTick',0:20:ymax,'FontSize',12, 'FontWeight','bold');
ylabel('Depth, (m)', 'FontSize',12, 'FontWeight','bold')    % y axis label
xlabel('Longitude', 'FontSize', 12, 'FontWeight', 'bold')

ax3b=axes('Position',get(ax3,'Position'),'YAxisLocation','right', ...
    'Color','none','YColor','k', 'Fontsize',12, 'Fontweight', ...
    'bold','xlim', xlim,  'ylim', [0 ymax], 'YTick',0:20:ymax, 'ydir','reverse','YTickLabel',' ');

Pos3=get(ax3,'Position');



