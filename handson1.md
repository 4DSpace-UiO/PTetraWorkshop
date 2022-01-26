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
Click on the left menu in the following order: `Geometry`->`Elementary entities`->`Add`. At the end of this your left window should look like the following,

<img width="720" alt="gmsh2" src="https://user-images.githubusercontent.com/11753189/151258227-b0158c98-d13c-462b-a501-7e609e749f23.png">

**Note:** From now onwards in this section our mostly used tools will be `Circle arc`, `Surface filling`, and `Volume`. 

First rotate your geometry with a view where you can see the different planes. 

<img width="720" alt="gmsh3" src="https://user-images.githubusercontent.com/11753189/151258741-c10d08fe-bf73-4d7a-84ab-85997d25178d.png">

## Geometry
### Elemetary entities
#### Circle arc
Next, choose `Circle arc` from the left menu and select the first point on your outer sphere to make a arc. Then the centre of the sphere followed by the end point of the arc.
**Note:**
```geo
Circle(id) = {start, center, end};
id: unique id assigned to each element with a specific type 
start, end:start and end points of an arc
center: center of the arc/circle
```
<img width="720" alt="gmsh4" src="https://user-images.githubusercontent.com/11753189/151259875-92b9d67f-71db-4e6d-82a9-dd0eaeebe75a.png">

Now repeat the same for all the arcs on the outer sphere. By the end, it should look like the following,

<img width="720" alt="gmsh5" src="https://user-images.githubusercontent.com/11753189/151260328-e379186e-fd29-4c11-a21d-662f47ecc22e.png">

Now, we need to do the same for the inner sphere. The first step should be similar. 
Note: make sure to `zoom in` to have a clearer view.

<img width="720" alt="gmsh6" src="https://user-images.githubusercontent.com/11753189/151260707-750a4f9e-0352-4c9f-9c15-f2b11d373d0b.png">

Now, try to connect all the points forming arcs on the inner sphere (probe). The final product should look like,

<img width="720" alt="gmsh7" src="https://user-images.githubusercontent.com/11753189/151261082-140f43ac-ef7a-404e-9622-6b15626deee7.png">

Now, press `q` to come out of the `Circle arc` action.

Next,
#### Surface filling

Choose `Surface filling` from the left menu and select the first arc on your outer sphere. Then, continue to select the next two arc forming a curve surface segment of a sphere. Finally, end the selection by pressing the key `E` on your keyboard. After pressing `E`, you should be able to see a faint dotted curve forming the surface you just created.

<img width="720" alt="gmsh8" src="https://user-images.githubusercontent.com/11753189/151262753-61566520-0b81-4eac-8445-9cbbf624500d.png">
<img width="720" alt="gmsh9" src="https://user-images.githubusercontent.com/11753189/151262773-0a16e64b-c2ab-431f-a589-06ebfa27d461.png">

Now, repeat the process for all the curved surfaces on the outer sphere. The final product should look like,

<img width="720" alt="gmsh10" src="https://user-images.githubusercontent.com/11753189/151263014-2e32e6f7-1c54-437b-b72f-381dd5178cc7.png">

Next, repeat the same for the inner sphere. Remember to zoom in before you select the arcs to form the surface.

<img width="720" alt="gmsh11" src="https://user-images.githubusercontent.com/11753189/151263413-2025b6b5-4885-4754-afc1-05eaf550b369.png">
<img width="720" alt="gmsh12" src="https://user-images.githubusercontent.com/11753189/151263429-5956d28f-3b0d-40d2-8a35-87819ef11ca7.png">

Now repeat the same process for all the curved surfaces of the inner sphere. The final product should look like,

<img width="720" alt="gmsh13" src="https://user-images.githubusercontent.com/11753189/151263647-e22418d2-272b-4c31-a93e-11037662bc87.png">


Next,
#### Volume

Choose `Volume` from the left menu and select the dotted curved surface line on the outer sphere first followed by the dotted curved surface lines on the inner sphere. Press `E` to end the selection. In the end the you should be able to see a `yellow` round ball at the centre.

<img width="720" alt="gmsh14" src="https://user-images.githubusercontent.com/11753189/151264252-080e7494-91df-48a2-93fc-55a81569ecc3.png">
<img width="720" alt="gmsh15" src="https://user-images.githubusercontent.com/11753189/151264270-7d358b1f-7be3-49c8-b532-8b4c52811685.png">

Press `Q` to abort and exit the action.

Next, 

### Physical groups
#### Surface
Expand the `Physical groups` tree on the left menu to see available groups. Choose `Surface` and select all the curved sufaces on the outer sphere by clicking on the dotted lines. Press `E` to end the selection.
<img width="720" alt="gmsh16" src="https://user-images.githubusercontent.com/11753189/151265002-bc26354c-b639-4be1-9551-64a4bb1e5851.png">

Now, repeat the same for the inner sphere. Complete the selection by pressing `E` in the end.

<img width="720" alt="gmsh17" src="https://user-images.githubusercontent.com/11753189/151265321-51b6602d-f4d5-42c8-928d-32fbb1558456.png">

Press `Q` to abort and exit the action.

Note: If you need segmented biased probe. Select the top half of the inner sphere and bottom half of the sphere separately.

Next,
#### Volume
Choose `Volume` and select the yellow sphere at the centre. After selection the `Yellow` sphere becomes `Red`. Press `E` to end the selection. Finally, press `Q` to abort and exit the action.

<img width="720" alt="gmsh18" src="https://user-images.githubusercontent.com/11753189/151265821-89f97506-32e1-4f9a-84af-bdb34a4e926c.png">

So, we have now finished our `Geometry`. Next, 

## Mesh 

