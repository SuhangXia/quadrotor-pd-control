function R = xyz2R(phi, theta, psi)
R = rotZ(psi) * rotY(theta) * rotX(phi);