# Running an interactive molecular dynamics (IMD) simulation on Andes using GROMACS
This is a simple example of using VMD and GROMACS to run an IMD simulation on Andes.
Ideally, you would first obtain an interactive compute node on the GPU partition and then run ./gromacs_run.sh.
However, it should still work if you land in the batch partition, just with reduced performance.

```
# Obtain an interactive node
salloc -N 1 -t 15 -A <project_id> -p gpu

# Once on a compute node
./gromacs_run.sh
```
After running the `gromacs_run.sh` script, eventually the simulation will wait for an IMD session to be established. The user will need to have a second terminal and
connect to the GROMACS simulation using VMD's IMD extension before the simulation will resume.

The workflow in gromacs_run.sh was adapted from http://www.mdtutorials.com/gmx/lysozyme/index.html


