# AI-PDDL
AI PDDL Project. Modelling an ambulance service.

The purpose behind this project was to model a simplified and hypothetical ambulance service. The aim of the planner was to get patients to nearest hospital as quick as possible. Please read the report for a comprehensive explanation.

To run:
<ol>
<li> Open cmd and naviage to the folder containing all required files. </li>
<li> Use the following command: optic-clp.exe theDomainFile.pddl theProblemFile.pddl </li>
<li> To get a non-optimised result do this: optic-clp.exe -N theDomainFile.pddl theProblemFile.pddl </li>
</ol>

NB: The planner uses a lot of RAM, so at times you may not be able to get a fully optimised results. In such cases I would recommend opting for the non-optimised result.
