set VOTES;
set OTHER_ALTERNATIVES;

param special_score{i in VOTES};
param other_score{i in VOTES, j in OTHER_ALTERNATIVES};

var keep_vote{i in VOTES}, binary;
var score;

minimize fin_score: score;

s.t. mod_score: score >= sum{i in VOTES} (1-keep_vote[i]);

s.t. remove_vote{j in OTHER_ALTERNATIVES}: 
sum{i in VOTES} other_score[i,j]*keep_vote[i] <= 
sum{i in VOTES} special_score[i]*keep_vote[i]; 

data;

set VOTES := v1 v2 v3 v4;
set OTHER_ALTERNATIVES := a b;

param special_score := v1 1 v2 1 v3 0 v4 1;
param other_score: a b :=
		v1 2 0
		v2 2 0
		v3 1 2
		v4 0 2;

end;
