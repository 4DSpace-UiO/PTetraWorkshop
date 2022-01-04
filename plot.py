#!/usr/bin/env python3
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import langmuir as l
from frmt import print_table
import re
import os

# READ HISTORY FILE

column_names = [
    'timestep',
    'time',
    'netot',
    'nitot',
    'Te_eff',
    'pot1',
    'sc_phi_0',
    'sc_q_0',
    'sc_i_0',
    'sc_phi_1',
    'sc_q_1',
    'sc_i_1',
]

hst_file = os.path.join(sys.argv[-1], 'pictetra.hst')
dat_file = os.path.join(sys.argv[-1], 'pictetra.dat')

with open(dat_file) as file:
    lines = file.read()

density = float(re.search(r'\s+ne\s*=\s*(\S*)', lines).groups()[0])
temperature = float(re.search(r'\s+te\s*=\s*(\S*)', lines).groups()[0])
voltages = re.search(r'\$begin sc_fixedPot\s*(\S*)\s*(\S*)', lines)
voltages = list(map(float, voltages.groups()))

elec = l.Electron(n=density, eV=temperature)
I_OML = l.OML_current(l.Sphere(r=0.5*elec.debye), elec, V=voltages[0])

print("Temperature:    {:.0f} K ({:.3g} eV)".format(elec.T, elec.eV))
print("Density:        {:.3g} /m^3".format(elec.n))
print("Debye length:   {:.3g} mm".format(elec.debye*1e3))

df = pd.read_csv(hst_file, sep='\s+', skiprows=2, names=column_names, index_col=0)

# Add new column sc_i_tot for total collected spacecraft current
df = df.assign(sc_i_tot=lambda a: a.sc_i_0 + a.sc_i_1)

tau = 1e-6 # relaxation time in seconds
delta_t = df.time[1]-df.time[0]
alpha = 1-np.exp(-delta_t/tau)

# Add new columns for exponential moving average
for col in ['sc_i_0', 'sc_i_1', 'sc_i_tot']:
    df = df.assign(**{col+'_av': lambda a: a[col].ewm(alpha=alpha).mean()})


I_PT = df.sc_i_tot_av.iat[-1]

print("OML current:    {:.3g} uA".format(I_OML*1e6))
print("PTetra current: {:.3g} uA".format(I_PT*1e6))
print("Error:          {:.2}%".format(100*(I_PT-I_OML)/I_OML, "%"))

plt.plot(df.time*1e6, df.sc_i_tot*1e6, '#ccc')
plt.axhline(I_OML*1e6, linestyle='--', color='k', label='OML')
plt.plot(df.time*1e6, df.sc_i_tot_av*1e6, label='PTetra')
plt.xlabel('Time [us]')
plt.ylabel('Current [uA]')
plt.legend()
plt.show()
