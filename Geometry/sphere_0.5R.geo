// STEP 1: SET VARIABLES

debye = 0.00690; // Electron debye length for n=1e11 and T=1000
r = 0.5*debye;   // Inner radius
R = TBD;         // Outer radius
Res = TBD;       // Resolution on outer boundary
res = TBD;       // Resolution on inner boundary

// STEP 2: PLACE POINTS (0D ENTITIES)

// Center
Point(1) = {0, 0, 0, Res};

// Outer boundary
Point(2) = {R, 0, 0, Res};
Point(3) = {0, R, 0, Res};
Point(4) = {0, 0, R, Res};
Point(5) = {-R, 0, 0, Res};
Point(6) = {0, -R, 0, Res};
Point(7) = {0, 0, -R, Res};

// Inner boundary
Point(8) = {r, 0, 0, res};
Point(9) = {0, r, 0, res};
Point(10) = {0, 0, r, res};
Point(11) = {-r, 0, 0, res};
Point(12) = {0, -r, 0, res};
Point(13) = {0, 0, -r, res};
