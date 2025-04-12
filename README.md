


The files here are used to setup and run umbrella sampling simulations. 

get-windows-insert.tcl is used to seed windows from the trajectory file obtained through steered MD simulations.
This file measures the distance between the center of mass of the P atoms in the upper leaflet and V30 of pHLIP and 
outputs the pdb file and restart files needed to start US simulations for every window along the reaction coordinate.

Us-base.in serves as a template for the colvars file needed to hold the molecule with a force of 2.5 kcal/mol/A^2 in a 
window with a width of 1 Angstrom centered for each reaction coordinate. win-base.conf serves as a template for configuration
file needed to run US using NAMD 2.14. This file contains the starting information needed to perform these simulations 
such as starting coordinates, CHARMM force field parameters, and system parameters to run NPT simulation during the 
umbrella sampling.

Setup-windows.tcl uses the US-base.in and win-base.in templates to write a colvars file for each window centered at the 
respective reaction coordinate and a config file that calls for the starting files and colvars file cooresponding to each 
window. After running this tcl script, the US simulations are prepared to run 50 ns of US using a 1 fs timestep. To continue
these simulations, setup-windows-2fs.tcl is used to run these simulations for the remainder of the time with a 2 fs timestep.

After running the simulations, the colvars output is written for each window with the colvars distance measurements. These values 
can be validated using the get-rxncoor.tcl which makes measurements based on the same selections used for the collective variables
module for each frame in the trajectory file. These values should be the same as the colvars output.

The colvars output file provides the sampling at each window given the preset force applied to hold the molecule in the desired window.
This sampling gives us the biased free energy, this colvars output will be used with the "wham" command in LOOS to generate the PMF.
