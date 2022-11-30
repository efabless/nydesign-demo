# NYDesign Demo

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

This repository provides simple demonstration project template for getting starting with Efabless chipIgnite for the NYDesign Program.

1. To use this template, make sure you have a github account and are logged in.   Follow https://github.com/efabless/nydesign-demo/generate to create a new repo and provide a name for your project 
   
2. Clone your project and run setup...

	>`git clone <your github repo URL>`
  
	>`cd <project_name>` # project_name is the name of your repo

	>`mkdir dependencies`

	>`export OPENLANE_ROOT=$(pwd)/dependencies/openlane_src` # you need to export this whenever you start a new shell

	>`export PDK_ROOT=$(pwd)/dependencies/pdks` # you need to export this whenever you start a new shell

	>`export PDK=sky130A`

	>`make setup`
