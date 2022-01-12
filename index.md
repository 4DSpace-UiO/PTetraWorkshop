# Welcome to PTetra Workshop

### About PTetra

PTetra is an electrostatic, high performance PIC code intended for simulating spacecraft in their plasma environment, and that it's an unstructured code, which allows for highly flexible geometries.

### Goal
What we hope to achieve with this workshop is to give people a skill or tool they can actually use in research. We want them to have a working
knowledge from start to end with at least one tool, PTetra.

### Dates

There will be four sessions, first with a presentation followed by some hands-on:

**Dates**: 
1. 25.01.2022
2. 27.01.2022
3. 01.02.2022
4. 03.02.2022

**Time**: 15:00 - 17:00 CET

- **Session 1**: 
  - Introduction to PTetra Workshop and description of case studies (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)), 25.01.2022, 15:00 - 15:30 CET
  - Mesh generation with Gmsh (by [Dr. Sayan Adhikari, UiO, Norway](https://www.mn.uio.no/fysikk/english/people/aca/sadhi/index.html)), 25.01.2022, 15:30 - 17:00 CET
- **Session 2**:
  - Introduction to PIC and simulations with PTetra (by [Prof. Richard Marchand, University of Alberta, Edmonton, Canada](https://sites.ualberta.ca/~rmarchan/) ), 27.01.2022, 15:00 - 17:00 CET
- **Session 3**:
  - More about PTetra and hands-on (by [Prof. Richard Marchand, University of Alberta, Edmonton, Canada](https://sites.ualberta.ca/~rmarchan/) ), 01.02.2022, 15:00 - 16:00 CET
  - Introduction to HPC and demonstration of a typical PTetra run on HPCs (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)), 01.02.2022, 16:00 - 17:00 CET
- **Session 4**:
  - Post-processing, visualization with ParaView, and comparison with Langmuir library (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)), 01.02.2022, 15:00 - 17:00 CET

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
- [Zoom Client for Meetings](https://zoom.us/download) (Download and install the appropriate version to have a smoother experience during the workshop)

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
Extract the source codes for PTetra using the 7zip tool. It will ask for a password; use the password shared on email.
```bash
7za x PTetra.zip
```
### STEP - 6: 
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
### STEP - 7:
Create symbolic links for PTetra
```bash
ln -s MPI_V50i/mptetra
```
Create symbolic links for msh2topo
```bash
cd Geometry
ln -s ../msh2topo/msh2topo
cd ..
```
### STEP - 8:
Install Paraview

#### Installing on Linux
Download the installer for Linux preferably to $HOME
[Link: ParaView-5.10.0-MPI-Linux-Python3.9-x86_64.tar.gz](https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.10&type=binary&os=Linux&downloadFile=ParaView-5.10.0-MPI-Linux-Python3.9-x86_64.tar.gz)

#### Installing on macOS
Download the installer for macOS.

For macOS with M1 processor (ARM)
[Link: ParaView-5.10.0-MPI-OSX11.0-Python3.9-arm64](https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.10&type=binary&os=macOS&downloadFile=ParaView-5.10.0-MPI-OSX11.0-Python3.9-arm64.pkg)

For macOS with intel processor (x86_64)
[Link: ParaView-5.10.0-MPI-Linux-Python3.9-x86_64](https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.10&type=binary&os=macOS&downloadFile=ParaView-5.10.0-MPI-OSX10.13-Python3.9-x86_64.pkg)

Double click on the ``.pkg`` file to install.


### Support or Contact

Having trouble with setting up your machines? Join our [Slack workspace](https://join.slack.com/t/ptetraworkshop/shared_invite/zt-11do628gg-q~zkVBwJhbPE0wjtP99GOQ) and we’ll help you sort it out.
