# Welcome to PTetra Workshop

### Goal
What we hope to achieve with this workshop is to give people a skill or tool they can actually use in research. We want them to have a working
knowledge from start to end with at least one tool, PTetra.

### Dates

There will be three sessions, first with a presentation followed by some hands-on:

**Probable dates**: 25.01, 27.01, 01.02, 03.02

**Time**: 15:00 - 17:00 CET

- **Session 1**: 
  - Introduction to PTetra Workshop (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en))
  - Description of case studies and mesh generation with Gmsh (by [Dr. Sayan Adhikari, UiO, Norway](https://www.mn.uio.no/fysikk/english/people/aca/sadhi/index.html))
- **Session 2**:
  - Introduction to PIC and simulations with PTetra.  (by [Prof. Richard Marchand, University of Alberta, Edmonton, Canada](https://sites.ualberta.ca/~rmarchan/) )
- **Session 3**:
  - Post-processing, visualization with ParaView, and comparison with Langmuir library. (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en))

## Prerequisites

- Access to a Unix/Linux machine
- ``PTetra`` (must be compiled)
- [``BLAS``](http://www.netlib.org/blas/) (must be compiled separately, and ``libblas.a`` moved to PTetra folder)
- [``SPARSKIT2``](http://www-users.cs.umn.edu/~saad/software/SPARSKIT) (must be compiled separately, and ``libskit.a`` moved to PTetra folder)
- ``msh2topo`` (must be compiled, to be used together with ``PTetra``)
- ``ParaView``
- [``Gmsh``](https://gmsh.info)
- ``Python 3``
  - ``Pandas``
  - ``Numpy``
  - ``Matplotlib``
  - ``Langmuir``

## Installation

### STEP - 1:
Install ``Conda``

#### Installing on Linux
Download the Miniconda installer for Linux.
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
Run the installer and follow the interactive instruction.
```bash
bash Miniconda3-latest-Linux-x86_64.sh
```
#### Installing on macOS
Download the Miniconda installer for macOS.
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
```
Run the installer and follow the interactive instruction.
```bash
bash Miniconda3-latest-MacOSX-x86_64.sh
```

### STEP - 2: 
Clone the workshop repository
```bash
git clone https://github.com/4DSpace-UiO/PTetraWorkshop.git
```
Enter inside the repository
```bash
cd PTetraWorkshop
```

### STEP - 4: 
Now create a conda environment using the given environment.yml file
```bash
conda env create -f environment.yml
```
Activate the conda environment
```bash
conda activate ptetra
```
### STEP - 5: 
Compile BLAS
```bash
cd BLAS-3.10.0
make
cd ..
```
Compile SPARSKIT
```bash
cd SPARSKIT2
make
cd ..
```
Compile msh2topo
```bash
cd msh2topo
make
cd ..
```
Copy the linked libraries
```bash
cp BLAS-3.10.0/blas_LINUX.a MPI_V50i/libblas.a 
cp SPARSKIT2/libskit.a MPI_V50i/libskit.a 
```
Compile PTetra
```bash
cd MPI_V50i
make
cd ..
```
### STEP - 6:
Create symbolic links for PTetra
```bash
ln -s MPI_V50i/mptetra ./
```
Create symbolic links for msh2topo
```bash
ln -s msh2topo/msh2topo Geometry/
```

<!-- - Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text
 [Link](url) and ![Image](src) -->



### Support or Contact

Having trouble with setting up your machines? Join our [Slack workspace](https://join.slack.com/t/ptetraworkshop/shared_invite/zt-11do628gg-q~zkVBwJhbPE0wjtP99GOQ) and we’ll help you sort it out.
