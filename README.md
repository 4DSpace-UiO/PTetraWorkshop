# Add symlinks

In the root folder of this repo, add symlinks to your installation of PTetra and msh2topo:

    ln -s path/to/mptetra
    ln -s path/to/msh2topo

# Mesh naming convention

Mesh files are named:

    sphere_<radius>.*
    cylinder_<radius>_<length>.*

depending on geometry. Radius and length are in debye lengths. File suffixes
are .geo, .msh and .topo for the geometry, the mesh in Gmsh-format, and mesh in
PTetra-format, respectively.
