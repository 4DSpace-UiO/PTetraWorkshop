# Add symlinks

In the root folder of this repo, add symlinks to your installation of PTetra and msh2topo:

    ln -s path/to/mptetra
    ln -s path/to/msh2topo

# Naming conventions

We use certain naming conventions not only for human readability but also for
computer parseability.

Mesh and geometry files such as

    Geometry/sphere_0.5R.*
    Geometry/cylinder_0.5R_5L.*

depending on geometry. The numbers are radius (R) and length (L) in debye
lengths. File suffixes are .geo, .msh and .topo for the geometry, the mesh in
Gmsh-format, and mesh in PTetra-format, respectively.

Simulations are in folders starting with similar name as the mesh:

    Cylinder_0.5R_5L_3Vu_5Vl

This folder is of a simulation where the upper segment of the cylinder is 3V
and the lower 5V.
