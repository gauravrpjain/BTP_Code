%Loading the file for the give sample and thermal cycle 
Temp = load('0.38C_Iso_350.mat','Temp'); %Loads the temperature variation
Time = load('0.38C_Iso_350.mat','Time'); %Loads the time corresponding to the variation
Delat_L = load('0.38C_Iso_350.mat','Rel_change'); %Loads the relative change in length corresponding to the time and temperature

%Declaring the lattice parameters
