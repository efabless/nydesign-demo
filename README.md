# NYDesign Demo

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

This repository provides simple demonstration project template for getting starting with Efabless chipIgnite for the NYDesign Program.

- To use this template, make sure you have a github account and are logged in.
- Click on the *Use this template* button in the upper right and provide a name for your project

   *   Follow https://github.com/efabless/caravel_user_project/generate to create a new repository.
   *   Clone the reposity using the following command:
   
   .. code:: bash
    
	git clone <your github repo URL>
	
#.  To setup your local environment run:

    .. code:: bash
    
    	cd <project_name> # project_name is the name of your repo
	
    	mkdir dependencies
	
      export OPENLANE_ROOT=$(pwd)/dependencies/openlane_src # you need to export this whenever you start a new shell

      export PDK_ROOT=$(pwd)/dependencies/pdks # you need to export this whenever you start a new shell

      export PDK=sky130B

      make setup
