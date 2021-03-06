%Loading the file for the give sample and thermal cycle 
Temp = load('0.38C_Iso_350.mat','Temp'); %Loads the temperature variation
Time = load('0.38C_Iso_350.mat','Time'); %Loads the time corresponding to the variation
Delat_L = load('0.38C_Iso_350.mat','Rel_change'); %Loads the relative change in length corresponding to the time and temperature

%Declaring the carbon concentrations
Carbon_Sample = 0.38;
Carbon_Cementite = 6.67;
Carbon_Low_c_Ferrite = 0.02;
Carbon_Ferrite = 0.2;
Carbon_epsilon_carbide = 6.67;

%Declaring Lattice Parameters - All are in Angstroms
Lattice_Ferrite_a = 2.8664-(130*(10^-4)*Carbon_Ferrite);
Lattice_ferrite_c = 2.8664+(1191*(10^-4)*Carbon_Ferrite);
Lattice_Low_c_Ferrite_a = 2.8664-(130*(10^-4)*Carbon_Low_c_Ferrite);
Lattice__Low_c_ferrite_c = 2.8664+(1191*(10^-4)*Carbon_Low_c_Ferrite);
Lattice_Martensite_a = 2.8664-(130*(10^-4)*Carbon_Sample);
Lattice_Martensite_c = 2.8664+(1191*(10^-4)*Carbon_Sample);

Lattice_epsilon_a = 2.735;
Lattice_epsilon_c = 4.339;

Lattice_Cementite_a = 4.525;
Lattice_Cementite_b = 5.087;
Lattice_Cementite_c = 6.743;

%Calculating Volume of unit cell

%Calculating volume per unit iron atom

%Declaring the phases and their volume fractions

%Declaring the constraints

%Delaring the variables to play with - Overlap duration, Overlap_init_Temp,
%Kinetics_Ratio (1 for now) and any other...


%Iterating the calculation for variations of the variables 

    %calculating the volume change for this iteration
    %Calculation RMS error (per part, overall)
    %Plotting the fitting curve
    
    %Saving the fitting curve and saving the top 5 combinations with least
    %RMS
    
%Exitting loop