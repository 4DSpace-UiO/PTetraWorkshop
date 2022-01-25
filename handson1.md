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
boundary it should be a fifth of the radius.
<!---

Try to guess the answer to the following questions:

- How large do you think the outer boundary needs to be?
- What resolution do you need on the inner and outer boundary?

Post your answers on your group's Slack channel, and we will provide you with
reasonable numbers that you are to use in the actual mesh.

--->
Let the lower and upper half of the object be two distinct physical groups,
such that different voltages can be assigned to them in PTetra.

The mesh will be used for simulations in the next assignment. Although each
group only needs one mesh (to begin with), we encourage all participants to try
creating this mesh, asking their group for help before asking the organizers.
