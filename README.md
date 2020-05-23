# Astronomy-parts-with-Openscad
CAD designs for mechanical parts used in Astronomy, designed with OpenSCAD

For plastic parts, the workflow is as follow:
- create a parametric design with OpenSCAD.
- save in STL, slice with Cura
- 3D print, at home or online.

For metal parts, the workflow is as follow:
- create a parametric design with OpenSCAD.
- save in STL, slice the entire design or a part of it to Gcode with Cura, and 3D print for prototyping, iterate with the previous step.
- Once the 3D printed prototype is verified to be correct, save in .csg format in OpenSCAD.
- Open the .scg in FreeCAD and export to any of the machining format (usually .step).
- Identify the holes to be taped. 
- send to an online machining shop or to your favorite machinist, so the part can be milled.
