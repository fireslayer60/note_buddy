import joblib


physics_links = {
    "Kinematics": "https://www.khanacademy.org/science/ap-college-physics-1/xf557a762645cccc5:kinematics-and-introduction-to-dynamics",
    "Laws of Motion": "https://www.youtube.com/watch?v=kKKM8Y-u7ds",
    "Work, Energy, and Power": "https://www.physicsclassroom.com/class/energy",
    "Thermodynamics": "https://www.khanacademy.org/science/biology/energy-and-enzymes/the-laws-of-thermodynamics/v/introduction-to-entropy",
    "Mechanical Properties of Solids": "https://www.thoughtco.com/mechanical-properties-of-solids-1267603",
    "Electrostatics": "https://www.khanacademy.org/science/physics/electric-charge-electric-force-and-voltage/electric-field/v/electrostatics-part-2",
    "Current Electricity": "https://www.khanacademy.org/science/physics/electric-circuits/current/v/what-is-current",
    "Magnetic Effects of Current and Magnetism": "https://www.khanacademy.org/science/physics/magnetic-forces-and-magnetic-fields",
    "Optics": "https://www.khanacademy.org/science/physics/light-and-optics",
    "Dual Nature of Matter and Radiation": "https://www.khanacademy.org/science/ap-college-physics-1/optics/photon-nature-of-light/v/photons-and-the-dual-nature-of-light",
    "Displacement": "https://www.thoughtco.com/displacement-definition-1267585",
    "Velocity": "https://www.khanacademy.org/science/physics/one-dimensional-motion/average-velocity/v/what-is-velocity",
    "Acceleration": "https://www.physicsclassroom.com/class/one-dimensional-motion/u4l1c1.cfm",
    "Equations of Motion": "https://www.physicsclassroom.com/class/one-dimensional-motion/u2l1c1.cfm",
    "Laws of Thermodynamics": "https://www.khanacademy.org/science/biology/energy-and-enzymes/the-laws-of-thermodynamics/v/introduction-to-entropy",
    "Heat Transfer": "https://ocw.mit.edu/courses/2-051-introduction-to-heat-transfer-fall-2015/",
    "Thermal Expansion": "https://courses.lumenlearning.com/atd-austincc-physics1/",
    "Work and Heat": "https://www.physicsclassroom.com/class/energy",
    "Electric Fields": "https://www.khanacademy.org/science/physics/electric-charge-electric-force-and-voltage/electric-field/v/electrostatics-part-2",
    "Magnetic Fields": "https://www.khanacademy.org/science/physics/magnetic-forces-and-magnetic-fields",
    "Electromagnetic Induction": "https://www.physicsclassroom.com/Physics-Video-Tutorial/Static-Electricity/Charging-by-Induction/Video",
    "Modern Physics": "https://www.khanacademy.org/science/ap-college-physics-1/quantum-physics"
}

# Provided links for Chemistry topics
chemistry_links = {
    "Basic Concepts of Chemistry": "https://www.khanacademy.org/science/chemistry/chemistry-basics",
    "Structure of Atom": "https://www.khanacademy.org/science/chemistry/atomic-structure-and-properties",
    "Chemical Bonding and Molecular Structure": "https://www.khanacademy.org/science/chemistry/chemical-bonds",
    "Thermodynamics": "https://www.khanacademy.org/science/biology/energy-and-enzymes/the-laws-of-thermodynamics/v/introduction-to-entropy",
    "Equilibrium": "https://www.khanacademy.org/science/chemistry/chemical-equilibrium",
    "Solid State": "https://www.khanacademy.org/science/chemistry/solids-and-liquids",
    "Solutions": "https://www.khanacademy.org/science/chemistry/solutions",
    "Electrochemistry": "https://www.khanacademy.org/science/chemistry/electrochemistry",
    "Chemical Kinetics": "https://www.khanacademy.org/science/chemistry/chemical-kinetics",
    "Surface Chemistry": "https://www.khanacademy.org/science/chemistry/thermodynamics-and-equilibrium/adsorption/v/adsorption",
    "Lewis Structures": "https://www.khanacademy.org/science/chemistry/chemical-bonds/lewis-structures/v/lewis-structures-overview",
    "VSEPR Theory": "https://www.khanacademy.org/science/chemistry/chemical-bonds/vsepr-theory/v/vsepr-theory-and-molecular-shape",
    "Hybridization": "https://www.khanacademy.org/science/chemistry/chemical-bonds/hybridization/v/hybridization-overview",
    "Molecular Orbital Theory": "https://www.khanacademy.org/science/chemistry/chemical-bonds/molecular-orbital-theory",
    "Coordination Compounds": "https://www.khanacademy.org/science/chemistry/inorganic-chemistry/complexes",
    "P-Block Elements": "https://www.khanacademy.org/science/chemistry/the-periodic-table/p-block-elements",
    "D-Block and F-Block Elements": "https://www.khanacademy.org/science/chemistry/the-periodic-table/d-and-f-block-elements",
    "Biomolecules": "https://www.khanacademy.org/science/biology/chemistry-of-life/biomolecules",
    "Polymers": "https://www.khanacademy.org/science/biology/chemistry-of-life/polymers",
}

# Provided links for Mathematics topics
mathematics_links = {
    "Sets and Functions": "https://www.khanacademy.org/math/prealgebra/introduction-to-pre-algebra/sets/sets-intro/v/introduction-to-sets",
    "Algebra": "https://www.khanacademy.org/math/algebra",
    "Coordinate Geometry": "https://www.khanacademy.org/math/geometry/analytic-geometry-cartesian-coordinates",
    "Calculus": "https://www.khanacademy.org/math/ap-calculus-ab",
    "Statistics": "https://www.khanacademy.org/math/statistics-probability",
    "Relations and Functions": "https://www.khanacademy.org/math/prealgebra/introduction-to-pre-algebra/relations-and-functions/v/relations-and-functions-overview",
    "Vectors and 3D Geometry": "https://www.khanacademy.org/math/linear-algebra/vectors-and-matrices/linear-combinations-and-span/v/introduction-to-vectors",
    "Differential Equations": "https://www.khanacademy.org/math/differential-equations",
    "Probability": "https://www.khanacademy.org/math/statistics-probability/probability-basics",
    "Linear Programming": "https://www.khanacademy.org/math/linear-algebra/linear-programming",
    "Limits": "https://www.khanacademy.org/math/ap-calculus-ab/limits-and-continuity/limits-intro/v/what-is-a-limit",
    "Derivatives": "https://www.khanacademy.org/math/ap-calculus-ab/derivatives",
    "Integrals": "https://www.khanacademy.org/math/ap-calculus-ab/integrals",
    "Applications of Derivatives": "https://www.khanacademy.org/math/ap-calculus-ab/applications-of-derivatives",
    "Lines and Angles": "https://www.khanacademy.org/math/geometry/geometry-basics/lines-and-angles/v/introduction-to-lines-and-angles",
    "Circles": "https://www.khanacademy.org/math/geometry/circles/circles-basics/v/introduction-to-circles",
    "Conic Sections": "https://www.khanacademy.org/math/geometry/conic-sections",
    "Three-Dimensional Geometry": "https://www.khanacademy.org/math/geometry/3d-geometry",
    "Matrices and Determinants": "https://www.khanacademy.org/math/linear-algebra/matrices-and-determinants",
    "Complex Numbers": "https://www.khanacademy.org/math/complex-numbers",
    "Probability Distributions": "https://www.khanacademy.org/math/statistics-probability/probability-distributions",
    "Mathematical Reasoning": "https://www.khanacademy.org/math/proofs-and-logic",
}


