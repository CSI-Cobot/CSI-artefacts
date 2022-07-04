dtmc

// move_2
const double p_m2=0.8;
const double y1; // vary between 0 and 25
const double x_m2_1a= floor(y1/5); // number between 0 and 5
const double x_m2_1=x_m2_1a/5; // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0
const double x_m2_2a=y1-5*x_m2_1a; // number between 0 and 5
const double x_m2_2=min(x_m2_2a/5,1-x_m2_1); // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0 (but not larger than 1-x_m2_1)
const double x_m2_3=1-x_m2_1-x_m2_2;

// move_3
const double p_m3=0.8;
const double y2; // vary between 0 and 25
const double x_m3_1a= floor(y2/5); // number between 0 and 5
const double x_m3_1=x_m3_1a/5; // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0
const double x_m3_2a=y2-5*x_m3_1a; // number between 0 and 5
const double x_m3_2=min(x_m3_2a/5,1-x_m3_1); // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0 (but not larger than 1-x_m3_1)
const double x_m3_3=1-x_m3_1-x_m3_2;

// task_4
const double pt4success=0.9;
const double p_t4=0.8;
const double y3; // vary between 0 and 25
const double x_t4_1a=floor(y3/5); // number between 0 and 5;
const double x_t4_1=x_t4_1a/5; // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0
const double x_t4_2a=y3-5*x_t4_1a; // number between 0 and 5
const double x_t4_2=min(x_t4_2a/5,1-x_t4_1); // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0 (but not larger than 1-x_t4_1)
const double x_t4_3=1-x_t4_1-x_t4_2;

// move_4
const double p_m4=0.8;
const double y4; // vary between 0 and 25
const double x_m4_1a=floor(y4/5); // number between 0 and 5;
const double x_m4_1=x_m4_1a/5; // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0
const double x_m4_2a=y4-5*x_m4_1a; // number between 0 and 5
const double x_m4_2=min(x_m4_2a/5,1-x_m4_1); // 0.0, 0.2, 0.4, 0.6, 0.8 or 1.0 (but not larger than 1-x_m4_1)
const double x_m4_3=1-x_m4_1-x_m4_2;

module cobot 

  c : [0..30] init 0;

  // part 1 of the cobot process
 
  [] c=0 -> 1:(c'=1); // cobot idle at L0 -> process start -> move_1: cobot travels at L1
  
  [] c=1 -> 1:(c'=2); // cobot performs task_1 at L1

  [] c=2 -> p_m2:(c'=3) + (1-p_m2):(c'=7); // risk assessment before cobot travels to L3

  [] c=3 -> x_m2_1:(c'=4) + x_m2_2:(c'=5) + x_m2_3:(c'=6); // hazard mitigation actions for move_2

  [] c=4 -> 1:(c'=7); // cobot pauses for T seconds

  [] c=5 -> 1:(c'=7); // cobot slows speed

  [] c=6 -> 1:(c'=7); // cobot identifies alternative route

  [] c=7 -> 1:(c'=8); // cobot travels to L3

  // part 2 of the cobot process

  [] c=8  -> 1:(c'=9); // cobot performs task_2 

  [] c=9  -> 1:(c'=10); // cobot performs task_3

  [] c=10 -> p_m3:(c'=11) + (1-p_m3):(c'=15); // risk assessment before cobot travels to L1

  [] c=11 -> x_m3_1:(c'=12) + x_m3_2:(c'=13) +x_m3_3:(c'=14); // hazard mitigation actions for move_3

  [] c=12 -> 1:(c'=15); // cobot pauses for T seconds

  [] c=13 -> 1:(c'=15); // cobot slows speed 

  [] c=14 -> 1:(c'=15); // cobot identifies alternative route

  [] c=15 -> 1:(c'=16); // cobot travels to L1

  // part 3 of the cobot process

  [] c=16 -> 1:(c'=17); // cobot performs task_4

  [] c=17 -> pt4success:(c'=18) + (1-pt4success):(c'=19); // success or failure of task_4

  [] c=18 -> 1:(c'=25); // task_4 success

  [] c=19 -> p_t4:(c'=20) + (1-p_t4):(c'=23); // task_4 failure and risk assessement as the operator intervenes to correct the issue

  [] c=20 -> x_t4_1:(c'=21) + x_t4_2:(c'=22) + x_t4_3:(c'=23); // hazard mitigation actions for task_4  

  [] c=21 -> 1:(c'=24); // cobot arm pauses movement for T seconds

  [] c=22 -> 1:(c'=24); // cobot arm decreases the applied pressure 

  [] c=23 -> 1:(c'=24); // cobot arm continues normal operation

  [] c=24 -> 1:(c'=17); // cobot retries task_4

  // part 3 of the cobot process
 
  [] c=25 -> p_m4:(c'=26) + (1-p_m4):(c'=30); // risk assessment before cobot travels to L2 (starting location)

  [] c=26 -> x_m4_1:(c'=27) + x_m4_2:(c'=28) +x_m4_3:(c'=29); // hazard mitigation actions for move_4

  [] c=27 -> 1:(c'=30); // cobot pauses for T seconds

  [] c=28 -> 1:(c'=30); // cobot slows speed

  [] c=29 -> 1:(c'=30); // cobot identifies alternative route
  
  [] c=30 -> 1:(c'=0); // cobot travels to L2

endmodule

label "done" = c=30;

rewards "delay"
  c=4  : 20; // base - pause
  c=12 : 20; // base - pause
  c=27 : 20; // base - pause
  c=5  : 13; // base - slow speed
  c=13 : 13; // base - slow speed
  c=28 : 13; // base - slow speed
  c=6  : 15; // base - detour
  c=14 : 15; // base - detour
  c=29 : 15; // base - detour
  c=21 : 7; // arm  - pause
  c=22 : 4; // arm  - low pressure
endrewards

rewards "risk"
  c=4  : 0; // base - pause
  c=12 : 0; // base - pause
  c=27 : 0; // base - pause
  c=5  : 2; // base - slow speed
  c=13 : 2; // base - slow speed
  c=28 : 2; // base - slow speed
  c=6  : 1; // base - detour
  c=14 : 1; // base - detour
  c=29 : 1; // base - detour
  c=21 : 0; // arm  - pause
  c=22 : 1; // arm  - low pressure
endrewards