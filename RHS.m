%% Right Handside Polarized%%
clear all;clc;close all

%% Variables

Length_dom = 5;
Electric_Field_RHS = 1;
Frequency_RHS = 1;
Collisional_Freq = 1;

Numb_cells=input('Select the number of desired cells:');
    while mod(Numb_cells,1)~=0
        Numb_cells=input('Select an integer value please:');
    end
    
Time = input('Select time of computation:');
Steps = input('Select the number of desired steps:');
Deltat = Time/Steps;
DeltaX = Length_dom7Numb_cells;

for i=1:Numb_cells+1
    Pos_cells(i)=Length_dom*(i-1)/Numb_cells;
end

%Magnetic Field z will follow this equation Bz = 0.05z^2 + C; dBz/dz = 0.1z
for i = 1:Numb_cells+1
    Bz(i) = 0.05*Pos_cells(i)^2;
    dBz(i) = 0.1*Pos_cells(i);
end

Mass = 9.1e-31;
Charge = -1.6e-19;



%% Solving equations %% 
for i = 1:length(Pos_cells)
    




