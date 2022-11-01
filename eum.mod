set OUTCOMES;
set PREFS;

param distribgt{i in PREFS, j in OUTCOMES};
param distriblt{i in PREFS, j in OUTCOMES};

var utility{j in OUTCOMES}, >=0, <=1;
var difference;

maximize totaldiff: difference;

s.t. consistent{i in PREFS}: 
sum{j in OUTCOMES} (distribgt[i,j] * utility[j]) >= 
sum{j in OUTCOMES} (distriblt[i,j] * utility[j]) + difference;
 

data;

set OUTCOMES := A B C D;
set PREFS := p0 p1 p2 p3;

param distribgt :
	A  B  C  D :=
p0	.1 .2 .3 .4
p1	.4 .4 .1 .1
p2	.6 .1  0 .3
p3	.4 .3 .2 .1;

param distriblt :
	A  B  C  D :=
p0	.1 .2 .4 .3
p1	.4 .2 .2 .2
p2	.4 .3 .3  0
p3	.5 .5  0  0;
