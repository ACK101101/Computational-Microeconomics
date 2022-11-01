set TASKS;

param max_time;
param time_between{i in TASKS, j in TASKS};

var scheduled_time{i in TASKS}, >=0;
var last_time;
var earlier_than{i in TASKS, j in TASKS}, binary;

minimize total_time: last_time;

# set to >= to prevent solver from setting all values to 0
s.t. one_earlier{i in TASKS, j in TASKS}:
earlier_than[i,j]+earlier_than[j,i] >= 1;
s.t. last_one{i in TASKS}: last_time >= scheduled_time[i];
# if i earlier than j, time between j must be scheduled at least after i and the time between
s.t. time_diff_constraint{i in TASKS, j in TASKS}:
scheduled_time[j] >= (1-earlier_than[i,j])*(-max_time)+(scheduled_time[i]+time_between[i,j]);


data;

set TASKS := tA tB tC;

param max_time := 100;
param time_between :
   tA tB tC :=
tA  0 10 10
tB  8  0  4
tC  5 10  0;

end;
