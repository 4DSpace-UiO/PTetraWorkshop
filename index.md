# Welcome to the PTetra Workshop

Universities already excel at teaching knowledge. In this workshop, however, we
aim to teach you the *practical skills* necessary for applying simulations in
your own space or plasma-related research. This will complement the theoretical
background of the computational scientist, but there is also no reason for
experimentalists or theorists to put up with uncertain assumptions. We believe
you do not have to be a computational scientist to use simulations, in much the
same way you don't have to be a theoretician to use equations. In this
workshop, we provide you with a tool to complement your other methods, and to
go beyond their limitations. Rather than giving a vague overview of many tools,
we focus on providing working knowledge from beginning to end with one tool:
PTetra.

### About PTetra

PTetra is an electrostatic, high performance Particle-In-Cell (PIC) code, with
support for complex geometries through the use of an unstructured mesh. Its
main purpose is the study of spacecraft-environment interactions.

![Cylinder](https://raw.githubusercontent.com/4DSpace-UiO/PTetraWorkshop/gh-pages/cylinder.png)

Disclaimer: PTetra is Prof. Richard Marchand's property, but is provided for
the participants to use, with the belief that it will be instructive and
useful. The correctness of the results obtained with PTetra relies in part on
the skill of the user, and in any case, we take no responsibility for your
results. Any use of PTetra leading to publication should cite the following two
papers:

1. [Marchand - PTetra, a Tool to Simulate Low Orbit Satellite-Plasma Interaction](https://doi.org/10.1109/TPS.2011.2172638)
2. [Marchand, Lira - Kinetic Simulation of Spacecraft-Environment Interaction](https://doi.org/10.1109/TPS.2017.2682229)

### Dates

There will be three or four sessions, first with a presentation followed by some hands-on:

**Dates**: 
1. 25.01.2022
2. 27.01.2022
3. 01.02.2022 (maybe)
4. 03.02.2022

**Time**: 15:00 - 17:00 CET

- **Session 1 (25.01.2022)**: 

| Time              | Talk/assignmet                                                           |                                                                                                                  |
|-------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| 15:00 - 15:30 CET | [Introduction to the PTetra Workshop](lectures/introduction.pdf) (video) | [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)) |
| 15:30 - 17:00 CET | Mesh generation with Gmsh                                        (video) | [Dr. Sayan Adhikari, UiO, Norway](https://www.mn.uio.no/fysikk/english/people/aca/sadhi/index.html))             |
|                   | [Hands-on, part1](handson1.md)                                           |                                                                                                                  |

- **Session 1**: 
  - Introduction to the PTetra Workshop and description of case studies (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)), 25.01.2022, 15:00 - 15:30 CET
  - Mesh generation with Gmsh (by [Dr. Sayan Adhikari, UiO, Norway](https://www.mn.uio.no/fysikk/english/people/aca/sadhi/index.html)), 25.01.2022, 15:30 - 17:00 CET
- **Session 2**:
  - Introduction to PIC and simulations with PTetra (by [Prof. Richard Marchand, University of Alberta, Edmonton, Canada](https://sites.ualberta.ca/~rmarchan/) ), 27.01.2022, 15:00 - 17:00 CET
- **Session 3** (maybe):
  - More about PTetra (by [Prof. Richard Marchand, University of Alberta, Edmonton, Canada](https://sites.ualberta.ca/~rmarchan/) ), 01.02.2022, 15:00 - 16:00 CET
  - Introduction to HPC and demonstration of a typical PTetra run on HPCs (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)), 01.02.2022, 16:00 - 17:00 CET
- **Session 4**:
  - Post-processing, visualization with ParaView, and comparison with the Langmuir library (by [Dr. Sigvald Marholm, UiO, Norway](https://www.mn.uio.no/fysikk/english/?vrtx=person-view&uid=sigvaldm&lang=en)), 03.02.2022, 15:00 - 17:00 CET

## Prerequisites

- Access to a Unix/Linux machine
- Git
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
```bash
source ~/.bashrc
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
```bash
source ~/.bash_profile
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

Extract the compressed installer.
```bash
tar -xvf ParaView-5.10.0-MPI-Linux-Python3.9-x86_64.tar.gz
```
Create an alias of the executable by adding the following line at the end of your ``.bashrc`` file
```bash
alias paraview='~/ParaView-5.10.0-MPI-Linux-Python3.9-x86_64/bin/paraview'
```
```bash
source ~/.bashrc
```
#### Installing on macOS
Download the installer for macOS.

For macOS with M1 processor (ARM)
[Link: ParaView-5.10.0-MPI-OSX11.0-Python3.9-arm64](https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.10&type=binary&os=macOS&downloadFile=ParaView-5.10.0-MPI-OSX11.0-Python3.9-arm64.pkg)

For macOS with intel processor (x86_64)
[Link: ParaView-5.10.0-MPI-Linux-Python3.9-x86_64](https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.10&type=binary&os=macOS&downloadFile=ParaView-5.10.0-MPI-OSX10.13-Python3.9-x86_64.pkg)

Double click on the ``.pkg`` file to install.


### Support or Contact

Having trouble with setting up your machines? Join our [Slack workspace: PTetraWorkshop](https://ptetraworkshop.slack.com) and we’ll help you sort it out.
