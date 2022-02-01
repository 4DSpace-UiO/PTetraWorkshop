# Hands-on, part 2

Each group are assigned six simulations to carry out. The simulations will be
used for post-processing in session 4 (03.02.22), so complete all six
simulations before then. Use the Zoom breakout rooms assigned during the
session to agree on who does which simulations. For your own learning, make
sure that each member run at least one simulation (each simulation can be run
by several members if you wish). The simulations are a bit time-consuming, so
start early.

Below is a description of the sphere and cylinder assignments (depending on
which one you're assigned). After that follows some questions to be answered
during the Zoom event, before instructions on how to run the simulations.

## Sphere assignment

Neglect the effect of the magnetic field of the Earth. Instead of simulating
true atomic oxygen, which has a mass of 16 amu and is the predominant species
of the F-layer, we will use a reduced ion mass of 1/16 amu in order to speed up
computations. A representative orbital velocity is 7000 m/s, but increase this
so you preserve the Mach number when reducing the ion mass. Carry out five
simulations of the sphere, where

1. it is biased to 1V
2. it is biased to 2V
3. it is biased to 3V
4. one half is biased to 1V and the other to 3V
5. it is left at the floating potential

Save diagnostic output every 100th timestep.

Then, create a new mesh where the sphere has a radius of 5 debye lengths and
repeat the third simulation. Save diagnostic output every 10th timestep.

## Cylinder assignment

Neglect the effect of the magnetic field of the Earth, and to begin with, also
neglect the effect of the drift velocity by setting it to zero. Instead of
simulating true atomic oxygen, which has a mass of 16 amu and is the
predominant species of the F-layer, we will use a reduced ion mass of 1/16 amu
in order to speed up computations. Carry out five simulations of the cylinder,
where

1. it is biased to 1V
2. it is biased to 2V
3. it is biased to 3V
4. one half is biased to 1V and the other to 3V
5. it is left at the floating potential

Save diagnostic output every 100th timestep.

Then, repeat the third simulation, but with a drift velocity perpendicular to
the cylinder. A representative orbital velocity is 7000 m/s, but increase this
to preserve the Mach number when reducing the ion mass. Save diagnostic output
every 10th timestep.

## Questions for Zoom discussion

In the Zoom break discuss the following questions with your group, and try to
answer to arrive at an answer.

- How long will it take to reach steady-state, i.e., how long should the simulation run (in microseconds)? [Suggestion: 10 us]
- How many simulation particles would you use? [Suggestion: 5 million of each species]

We will drop by your room and see how your doing, as well as provide you with
the numbers you are actually to use in the simulations.

## Setting up a new simulation

First, make sure you're conda environment is active:

```batch
conda activate ptetra
```

For each simulation, you need to create a subfolder inside `PTetraWorkshop`,
for instance:

```batch
$ mkdir Cylinder_0.2R_10L_1V_1V_0kms
```

(recall the naming conventions in the
[introduction](lectures/introduction.pdf). You will need to run PTetra from
within this folder, so create a symlink to the PTetra executable inside the
folder (symlinks, or symbolic links, are like shortcuts in Windows, but
behave better):

```batch
$ cd Cylinder_0.2R_10L_1V_1V_0kms
$ ln -s ../MPI_V50i/mptetra
```

It is important that you execute `ln` from with the target folder when you use
relative paths such as `../MPI_V50i/mptetra`. Otherwise the symlink will point
to the wrong relative path.

Next, PTetra will look for the mesh (converted to topo-format using msh2topo in
[part 1](handson1.md)) in the file `meshpic.dat`. Create a symlink so PTetra
can find it:

```batch
$ ln -s ../Geometry/cylinder_0.5R.topo meshpic.dat
```

Finally, PTetra also needs the input file `pictetra.dat`. You can copy the file
from the example directory already in the repository:

```batch
$ cp ../Sphere_0.5R_1V_1V_112kms/pictetra.dat .
```

Next, you need to configure the simulation parameters in this file with the
text editor of your choice in accordance to the simulation you are running.
Documentation is available in the file, but you do not have to make any changes
to the injection parameters, solar parameters, charge exchange parameters or
reflection parameters. Pay attention to the plasma parameters.

Under simulation control parameters and numerical parameter, the number of
simulation particles and the physical end time of the simulations needs to be
edited according to the answers of your Zoom questions. The frequency of
diagnostic output should also be edited according to your assignment's
description. Other parameters under these categories are fine.

In addition, to specify fixed potentials on the two halves, you must set
`sc_fixedpotentials=.true.`. Then, the voltages are specified in the list
`sc_fixedPot`. The voltages in `sc_fixedPot` are assigned to the physical
groups in ascending order. For the floating potential simulation, you must set
`sc_fixedpotentials=.false.` in order to let the potentail be self-consistently
determined from the charging due to the plasma. In this case, `sc_nnetBias` and
`netBias` is used to control the relative voltage between the two halves, which
in our case, is to be zero. Since the two halve constitutes *one* circuit,
`sc_nnetBias=1`. `netBias` is as follows:
```
$begin netBias
nnodes=2
1  0.0
2  0.0
$end netBias
```
This means that if the first physical group is zero, then so is the second
group. It is only the *relative* voltages between the elements in `netBias`
that matters.

You can now start PTetra:

```batch
$ ./mptetra
```

From the output of PTetra, you should be able to answer (to yourselves):

- What is the surface area of the physical surfaces created in Gmsh?
- What is the statistical weight of the simulation particles? That is to say,
  how many physical particles does each simulaion particle correspond to?

## Starting over

If a simulation for some reason is erroneous, you should delete the output files:

```batch
$ rm *.vtk *.rdm *.topo *.hst fort.20
```

and then start over. If the mesh is incorrect, you need to replace
`meshpic.dat` with a symlink to the correct mesh, and also remove
`alujlu.prcnd` so PTetra can recreate it. `alujlu.prcnd` stores the
preconditioning matrix, and is mesh-dependent.

## Continue the simulation later

Since the simulations are a bit time-consuming, you may need to stop the
simulations, and continue later. To stop PTetra gracefully, enter the
simulation folder and create the file `.quit`:

```batch
touch .quit
```

PTetra will complete the time-step, and save restart files named
`pictetra<timestep>_<processor>.rdm`.

To continue the simulations, remove the
`.quit` file:

```batch
rm .quit
```

Change the entry `restartfrom` in `pictetra.dat` to point to the respective
restart file(s) and start PTetra as usual.

## Inspecting the simulations

While or after running simulations, it may be useful to run some diagnostics to
ensure that the simulations are correct. Use the attached script `plot.py` to
plot the current collected by the object, e.g.,

```batch
./plot.py Sphere_0.5R_1V_1V_112kms --OML
./plot.py Cylinder_0.2R_10L_1V_1V_0kms --FL
```

The `--OML` and `--FL` flags allow you to compare the simulations with OML
theory (most relevant for the spherical assignment) or finite length theory
(for cylinders), respectively.
