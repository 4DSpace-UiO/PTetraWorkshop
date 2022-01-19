# Hands-on, part 2

Each group are assigned six simulations to carry out. Split them among your
members, but let each member run at least one simulation (each simulation can
be run by several members if you wish). The simulations are a bit
time-consuming, so start early.

Below is a description of the sphere and cylinder assignments. After that
follow information useful to both groups.

## Sphere assignment

Neglect the effect of the magnetic field of the Earth. Instead of simulating
true atomic oxygen, which has a mass of 16 amu and is the predominant species
of the F-layer, we will use a reduced ion mass of 1/16 amu in order to speed up
computations. A representative orbital velocity is 7000 m/s, but increase this
to account for the reduced ion mass. Carry out five simulations of the sphere,
where

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
to account for the reduced ion mass. Save diagnostic output every 10th
timestep.

## Other parameters

A sample input file is available as `Sphere_0.5R_1V_1V_112kms/pictetra.dat`.
You do not have to make any changes to the injection parameters, solar
parameters, charge exchange parameters or reflection parameters. Pay attention
to the plasma parameters.

Also, try to guess the answer to the following questions:

- How long will it take to reach steady-state, i.e., how long should the simulation run (in microseconds)?
- How many simulation particles would you use? And what is the corresponding statistical weight?

Simulation control parameters and numerical parameters not relating to these
two questions are probably fine, at least to begin with. You will get good
suggestions to answers before you proceed, but try doing one of the simulations
with your own guessed numbers.

## Inspecting the simulations

While running simulations it may be useful to run some diagnostic to ensure
that the simulations are/have been running correctly. Use the attached script
`plot.py` to plot the current collected by the object, e.g.,

```batch
./plot.py Sphere_0.5R_1V_1V_112kms --OML
./plot.py Cylinder_0.2R_10L_1V_1V_0kms --FL
```

The `--OML` and `--FL` flags allow you to compare the simulations with OML or
finite-length theory, respectively.

## Continue the simulations later

Since the simulations are a bit time-consuming, you may need to stop the
simulations, and continue later. To stop PTetra gracefully, enter the
simulation folder and create the file `.quit`:

```batch
touch .quit
```

PTetra will complete the time-step, and save restart files named
`pictetra<timestep>_<processor>.rdm`. To continue the simulations, remove the
`.quit` file:

```batch
rm .quit
```

Change the entry `restartfrom` in `pictetra.dat` to point to the respective
restart file(s) and start PTetra as usual.
