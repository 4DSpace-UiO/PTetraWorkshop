# Hands-on, part 3

Play around with ParaView. Try to animate the fields.

![Visualizatio](handson3.gif)

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
