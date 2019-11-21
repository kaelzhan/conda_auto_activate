conda_auto_activate
===================

Automatically activate a conda environment when entering folders/project.

conda_auto_activate automatically activates a conda environment when
enterring a folder that contains a `environment.yml` or `.venv` file. 
The `environment.yml` can exported from a existed conda env and we 
use it to create a new conda env. The first line in the `.venv` file
is the name of the conda env.

To make this work you have to source conda_auto_activate.sh from your
~/.bashrc or ~/.zshrc.



```
source ~/path_to/conda_auto_activate.sh
```