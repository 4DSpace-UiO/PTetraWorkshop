# Hands-on, part 3

## Part a

Try to use ParaView to visualize fields. Here's a sugggestion: Choose the
simulation with most frequent output of VTK files (the sixth simulation). This
should also have a drift velocity. Then,

- Open the last `pictetra*.vtk` , and plot the potential in a 2D slice
  perpendicular to the drift velocity (and the cylinder).
- Make a line plot of the electric potential along the flow direction.
- Make an animation like the one below:
    - Open the entire group `pictetra*.vtk`
    - Make a 2D slize of the volumetric data, and then clip the slice twice to
      get an upper and lower half.
    - Choose to visualize the electron density and ion density in the two
      halves.
    - Open the entire group `scc*.vtk`, and choose to visualize the surface
      current density.
    - Hit play to animate.
    - Tune the colorbars as you find appropriate.

This particular animation is of a 0.5-Debye-length sphere at 1V. Your animation
may be different.

![visualization](handson3.gif)

## Part b

Use Python and Langmuir to plot the IV characteristic of the object according
to the OML theory (spherical assignment) or finite length theory (cylindrical
assignment) for the Oxygen plasma representative of the F-layer:

```python
plasma = [Electron(n=1e11, T=1000),
          Oxygen(n=1e11, T=1000)]
```

-1V to 4V is a good range of voltages. Once you have done that, plot one marker
(or "dot") for each of the three simulations with fixed voltages on top of the
IV-characteristic from Langmuir (it looks best if there's no line connecting
the dots). The steady-state currents can be found by reading `pictetra.hst` for
the simulations, taking the exponential moving average, and using the last
sample after averaging. Presumably, some functions in `func.py` can be reused.
See `func.py` and `plot.py` for examples.

Include also a marker for the floating potential simulation. In this case the
voltage must be read from `pictetra.hst`, preferrably by taking the last sample
after averaging. (For simplicity, it might be an option to read the voltage
from `pictetra.hst` for all four simulations).

Questions:

- Do the simulated currents agree with theory/past results?
- The floating potential according to Langmuir is where the IV-curve intersects
  the x-axis (you can see it if you zoom up). What is the floating potential
  obtained from Langmuir as well as from PTetra? Do they agree? Explain.
