%% Slabs of electrons displaced < DeltaX/2 from static slabs of ions (Check PIC code)
clear all;
clc;
 %% Variables
 
    Length_dom = 100;
    
 %% Initialized Data
 
    Numb_cells=input('Select the number of desired cells:');
    while mod(Numb_cells,1)~=0
        Numb_cells=input('Select an integer value please:');
    end
    
    Numb_part = 2;
    
    DeltaX = Length_dom/Numb_cells;
    DeltaX_electrons = rand*DeltaX/2;
    Time = input('Select time of computation:');
    Steps = input('Select the number of desired steps:');
    Deltat = Time/Steps;
    for i = 1:Steps
        Vector_time(i) = Deltat*i;
    end

    for i = 1:Numb_cells+1
        Pos_cells(i) = Length_dom*(i-1)/Numb_cells;
    end
    
    Mass = zeros(Numb_cells,Numb_part);
    Charge = zeros(Numb_cells,Numb_part);
    Pos_part = zeros(Numb_cells,Numb_part);
    Vel_part = zeros(Numb_cells,Numb_part);
    

    for i = 1:Numb_cells
        for j = 1:Numb_part
        a=rand;
            if a<=0.5
                Mass(i,j) = 9.1e-31;
                Charge(i,j) = -1.6e-19;
                %Pos_part(i,j) = Pos_cells(i)+DeltaX_electrons;
                Pos_part(i,j) = 51;
                Vel_part(i,j) = 0;
            else
                Mass(i,j) = 2.18; %mi >>> me
                Charge(i,j) = 1.6e-19;
                %Pos_part(i,j) = Pos_cells(i);
                Pos_part(i,j) = 50;
                Vel_part(i,j) = 0;
            end
        end
    end
        
    Index_part = Index_cells(Pos_part(:,:,1),Length_dom,Numb_cells);
    Figure = 1;

    for h = 1:Steps
        [Pos_part,Vel_part] = LeapFrog(Pos_part,Vel_part,Mass,Length_dom,Charge,Pos_cells,Numb_part,Numb_cells,Index_part,Deltat,h,Figure);
        Index_part = Index_cells(Pos_part(:,:,1),Length_dom,Numb_cells);
        for i = 1:Numb_part
            if Mass(1,i) == 9.1e-31
                 Pos_par(h) = Pos_part(1,i);
                 Vel_par(h) = Vel_part(1,i);
                 break
            end
        end   
    end
    
    figure(1)
    plot(Vector_time,Pos_par);
    figure(2)
    plot(Vector_time,Vel_par);
    
%     figure(Figure)
%     plot(Pos_part(1,1)+1,0.075,'.','LineWidth',2);
    
