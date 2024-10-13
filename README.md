# Feedforward PD Controller for Quadrotor UAVs

## Overview

This project implements a **Feedforward PD Controller** for quadrotor UAVs, utilizing MATLAB and Simulink for simulation, control design, and visualization. It provides a comprehensive model to simulate quadrotor dynamics and control behavior.

The repository contains:

- MATLAB scripts for control logic and data analysis
- Simulink models for system simulation
- Pre-generated figures and scope outputs for visualization
- Auxiliary scripts for plotting and figure management

## Table of Contents

1. [Project Structure](#project-structure)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Visualizations](#visualizations)

## Project Structure

```
graphql


Copy code
Feedforward-PD-Controller-for-QuadrotorUAVs/
│
├── Feedforward PD project/
│   ├── matlab2018b.slx         # Simulink model for quadrotor dynamics
│   ├── UAV.m                   # MATLAB script for UAV control
│   ├── lorenz3d.mdl            # Auxiliary model (for visualization)
│   ├── sfun3d.m                # 3D plot script
│
├── simulink-3d-scope-main/
│   ├── m3dscope.mdl            # 3D scope Simulink model
│   ├── lorenz3d.mdl            # Lorenz attractor model
│   ├── SECURITY.md             # Security policies
│
├── figure/
│   ├── *.fig                   # Pre-generated MATLAB figures
│   ├── PA3o.m, PA2.m           # Scripts to manipulate plots
│   ├── thrustU1toU4.m          # Thrust distribution plotting
│
├── README.md                   # Project documentation (this file)
└── dealFigure.m                # MATLAB script for figure adjustments
```

## Requirements

- **MATLAB** (tested with R2018b)
- **Simulink** (R2018b or later recommended)
- 3D scope and visualization toolbox (optional for advanced visualization)

## Installation

1. Clone the repository:

   ```matlab
   git clone <repository-url>
   ```

2. Open MATLAB and navigate to the project directory:

   ```matlab
   cd Feedforward-PD-Controller-for-QuadrotorUAVs
   ```

3. Open the Simulink model:

   ```matlab
   open('Feedforward PD project/matlab2018b.slx');
   ```

## Usage

1. **Simulate the Quadrotor:**
   Open the Simulink model and run the simulation to observe the quadrotor’s behavior under the feedforward PD control.
2. **Modify Control Logic:**
   Adjust the PD controller gains in `UAV.m` or within the Simulink model as needed to explore different system responses.
3. **Plot Figures:**
   Use `dealFigure.m` and other plotting scripts in the `/figure` folder to manipulate or generate new visualizations.
4. **3D Scope Visualization (Optional):**
   Open `m3dscope.mdl` under `simulink-3d-scope-main` to view dynamic visualizations using the 3D scope.

## Visualizations

Pre-generated figures are available in the `/figure` folder:

- **Trajectory plots** (`x.fig`, `z.fig`, etc.)
- **Control effort** (`u1.fig`, `u2.fig`, `u3.fig`, `u4.fig`)
- **Angles and dynamics** (`theta.fig`, `phi.fig`)

Example of generating thrust distribution plots:

```matlab
run('thrustU1toU4.m');
```