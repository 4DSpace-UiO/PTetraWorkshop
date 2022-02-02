# Hands-on, part 3

Choose one of the simulations to visualize in ParaView. For the most
interesting visualizations, choose one with a drift velocity, and frequent
output of VTK files (e.g., the sixth simulation).

- Open the `pictetra*.vtk` file for the latest potential, and plot the
  potential in a 2D slice perpendicular to the drift velocity (and the
  cylinder).
- Make a line plot of the electric potential along the flow direction.
- Make an animation like the one below:
    - Open the entire group `pictetra*.vtk`
    - Make a 2D slize of the volumetric data, and then clip the slice twice to
      get an upper and lower half.
    - Choose to visualize the electron density and ion density in the two
      halves.
    - Open the entire group `scc*.vtk`, and choose to visualize the surface
      current density.
    - Play!

<img src="handson3.gif" alt="visualization" width="200%"/>

Use Python and Langmuir to plot the IV characteristic of the object according
to OML theory (spherical assignment) or finite length theory (cylindrical
assignment) for the Oxygen plasma representative of the F-layer:

```python
plasma = [Electron(n=1e11, T=1000),
          Oxygen(n=1e11, T=1000)]
```

On top of that, indicate the results from the three simulations with fixed,
single voltages and the one with the floating potential with markers. Some
functions in `func.py` can probably be re-used. See `func.py` and `plot.py`.

Questions:

- Do the simulated currents agree with theory/past results?
- What is the floating potential obtained from the simulations? Does it agree with the theory? Explain.
- What do you observe for the last simulation? Is the discrepancy numerical or physical?
