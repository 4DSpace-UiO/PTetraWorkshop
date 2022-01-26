# Hands-on, part 1

In this hands-on assignment, each group shall create a mesh with the object to
simulate. Some groups are assigned a sphere, while others are assigned a
cylinder (announced on your Slack channels). We consider a plasma similar to
the F-layer of the ionosphere, with the following parameters.

- Electron and ion density: 1e11 /m^3
- Electron and ion temperature: 1000 K (=0.08617 eV)

The object has the following dimensions:

- Sphere: Radius of 0.5 electron Debye length
- Cylinder: Radius of 0.2 electron Debye lengths, and a length of 10 electron Debye lengths

You may find the files in the Geometry folder helpful to start with. Let the
outer boundary be of the same shape as the object, but extending 10 electron
Debye lengths beyond the object in every direction. The resolution on the outer
boundary can be taken to be 1.5 electron Debye lengths, whereas on the inner
boundary it should be a fifth of the radius. Let the lower and upper half of
the object be two distinct physical groups, such that different voltages can be
assigned to them in PTetra.

The mesh will be used for simulations in the next assignment. Although each
group only needs one mesh (to begin with), we encourage all participants to try
creating this mesh, asking their group for help before asking the organizers.

## Step by step guide to generate mesh for spherical probe
First open the ``sphere_0.5R.geo`` file using any of your text editor. We are going to use ``Vim`` as text editor throughout this guide. Feel free to use your preferred editors like Atom, gedit, nano if you feel comfortable. Make sure you are inside the `Geometry` directory before you do so. You can check it by typing the command `pwd`. 
```bash
vim sphere_0.5R.geo
```
It should look like,
```geo
// STEP 1: SET VARIABLES

debye = 0.00690; // Electron debye length for n=1e11 and T=1000
r = 0.5*debye;   // Inner radius
R = TDB;         // Outer radius
Res = TDB;       // Resolution on outer boundary
res = TDB;       // Resolution on inner boundary

// STEP 2: PLACE POINTS (0D ENTITIES)

// Center
Point(1) = {0, 0, 0, Res};

// Outer boundary
Point(2) = {R, 0, 0, Res};
Point(3) = {0, R, 0, Res};
Point(4) = {0, 0, R, Res};
Point(5) = {-R, 0, 0, Res};
Point(6) = {0, -R, 0, Res};
Point(7) = {0, 0, -R, Res};

// Inner boundary
Point(8) = {r, 0, 0, res};
Point(9) = {0, r, 0, res};
Point(10) = {0, 0, r, res};
Point(11) = {-r, 0, 0, res};
Point(12) = {0, -r, 0, res};
Point(13) = {0, 0, -r, res};
```
Change the radius and other parameters (as well as TDB) to your problem specific values. For the demonstration we are plannig to design a spherical probe with radius 0.5x**debye** length. To be able to edit the file using `Vim`, press `I` or the `Insert` key on your keyboard.
```geo
// STEP 1: SET VARIABLES

debye = 0.00690; // Electron debye length for n=1e11 and T=1000
r = 0.3*debye;   // Inner radius
R = r+10*debye;         // Outer radius
Res = 1.5*debye;       // Resolution on outer boundary
res = r/5;       // Resolution on inner boundary

// STEP 2: PLACE POINTS (0D ENTITIES)

// Center
Point(1) = {0, 0, 0, Res};

// Outer boundary
Point(2) = {R, 0, 0, Res};
Point(3) = {0, R, 0, Res};
Point(4) = {0, 0, R, Res};
Point(5) = {-R, 0, 0, Res};
Point(6) = {0, -R, 0, Res};
Point(7) = {0, 0, -R, Res};

// Inner boundary
Point(8) = {r, 0, 0, res};
Point(9) = {0, r, 0, res};
Point(10) = {0, 0, r, res};
Point(11) = {-r, 0, 0, res};
Point(12) = {0, -r, 0, res};
Point(13) = {0, 0, -r, res};
```
Save the file in ``Vim`` using the following sequence `Esc`,`:`,`w`,`q`,`!`,`Enter`.

Next, open this `.geo` file by using the following command in your terminal,
```bash
gmsh sphere_0.5R.geo
``` 
It should open up a window like the following,
<img width="720" alt="gmsh1" src="https://user-images.githubusercontent.com/11753189/151257062-0be27bb5-54e4-4284-b146-98c8ada49ecd.png">
```bash
├── BLAS-3.10.0
│   ├── CMAKE
│   │   ├── CheckLAPACKCompilerFlags.cmake
│   │   ├── PreventInBuildInstalls.cmake
│   │   └── PreventInSourceBuilds.cmake
│   ├── CMakeLists.txt
│   ├── Makefile
│   ├── TESTING
│   │   ├── CMakeLists.txt
│   │   ├── Makefile
```
