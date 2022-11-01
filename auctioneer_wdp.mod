set STATES;
set BIDS;

param bid_val{b in BIDS};
param amount_won{b in BIDS, s in STATES};

var accepted{b in BIDS}, binary;
var poss_profit{s in STATES};
var worst_case_profit;

maximize fin_profit: worst_case_profit;

s.t. not_neg{s in STATES}:
sum{b in BIDS} (amount_won[b,s] - bid_val[b]) * accepted[b] >= 0;

s.t. profit_calc{s in STATES}:
sum{b in BIDS} (amount_won[b,s] - bid_val[b]) * accepted[b] >= poss_profit[s]; 

s.t. worst{s in STATES}:
worst_case_profit <= poss_profit[s];

data;

set STATES := s1 s2 s3 s4;
set BIDS := b1 b2 b3 b4 b5;

param bid_val := b1 3 b2 4 b3 5 b4 3 b5 1;
param amount_won:
        s1 s2 s3 s4 :=
b1      0  0  11 0
b2      0  2  0  8
b3      9  9  0  0
b4      6  0  0  6
b5      0  0  0  10;

end;
