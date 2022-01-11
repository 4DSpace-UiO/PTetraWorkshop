// STEP 1: SET VARIABLES

debye = 0.00690; // Electron debye length for n=1e11 and T=1000
r = 0.5*debye;   // Inner radius
R = TBD;         // Outer radius
l = 5*debye;     // Inner length
L = TBD;         // Outer length
Res = TBD;       // Resolution on outer boundary
res = TBD;       // Resolution on inner boundary

// STEP 2: PLACE POINTS (0D ENTITIES)

// Outer Boundary
Point(1)  = { 0, -L/2,  0, Res};
Point(2)  = {+R, -L/2,  0, Res};
Point(3)  = {-R, -L/2,  0, Res};
Point(4)  = { 0, -L/2, +R, Res};
Point(5)  = { 0, -L/2, -R, Res};
Point(6) = { 0,  L/2,  0, Res};
Point(7) = {+R,  L/2,  0, Res};
Point(8) = {-R,  L/2,  0, Res};
Point(9) = { 0,  L/2, +R, Res};
Point(10) = { 0,  L/2, -R, Res};

// Inner Boundary
Point(11) = { 0, -l/2,  0, res};
Point(12) = {+r, -l/2,  0, res};
Point(13) = {-r, -l/2,  0, res};
Point(14) = { 0, -l/2, +r, res};
Point(15) = { 0, -l/2, -r, res};
Point(16) = { 0,    0,  0, res};
Point(17) = {+r,    0,  0, res};
Point(18) = {-r,    0,  0, res};
Point(19) = { 0,    0, +r, res};
Point(20) = { 0,    0, -r, res};
Point(21) = { 0,  l/2,  0, res};
Point(22) = {+r,  l/2,  0, res};
Point(23) = {-r,  l/2,  0, res};
Point(24) = { 0,  l/2, +r, res};
Point(25) = { 0,  l/2, -r, res};
