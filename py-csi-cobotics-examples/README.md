# py-csi-cobotics Example builds

The [py-csi-cobotics](https://github.com/Gaudeval/py-csi-cobotics) library is a Python framework for controlling and processing experiments built upon the CSI:Cobot Digital Twin. It captures the approach to Situation-based safety monitoring proposed on the CSI: Cobot project. The library features modules to generate twin scenes configuration files, collect and process message generated during a run, monitor for specific situations' occurrences, and assess the coverage achieved by a set of experimentations.

This repository contains the reference builds, compiled scenes of the CSI:Cobot Digital Twin, used in the example experiments included as part of py-csi-cobotics:
- `tcx_safety/` is an industrial case study where a collaborative robotic arm components delivered by a human operator using a caged welder. The setup includes a safety controller aimed to ensure the safety of the operator within the cell.
- `gcc_tutorial/` shows a mobile robot base navigating around a cell while a human operator crosses its path. The simple robot controller aims to prevent collision. The setup is used as part of the py-csi-cobotics tutorial on setting up the framework for interacting with an instance of the twin.
