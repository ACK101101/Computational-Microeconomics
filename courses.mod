set REQUIREMENTS;
set COURSES;

# >=0, <=1 for fractional --- binary for integral
var courses_taken{j in COURSES}, >=0, <=1;

param point_req{i in REQUIREMENTS};
param points_offer{i in REQUIREMENTS, j in COURSES};
param effort{j in COURSES};

minimize total_effort: sum{j in COURSES} effort[j]*courses_taken[j]; 

# check if courses taken fill the requirements
s.t. req_filled{i in REQUIREMENTS}: sum{j in COURSES} 
courses_taken[j]*points_offer[i, j] >= point_req[i];

data;

set REQUIREMENTS := ns ss hm;
set COURSES := c1 c2 c3 c4;

param point_req := ns 10 ss 10 hm 10;
param points_offer : 
    c1 c2 c3 c4 := 
ns  8  3  5  4 
ss  6  6  3  2 
hm  4  8  1  2;
param effort := c1 5 c2 5 c3 2 c4 2;

end;
