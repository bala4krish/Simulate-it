# Simulate-it
Simulations of some simple systems demonstrating control systems basics using Simulink

## 1. Kalman_LQR_Estimation_Control
The matlab file [Kalman_FSFB.m](Kalman_FSFB.m) shows the calculation for filter dynamics and LQR feedback gain. The simulink model is implemented in [Kalman_FSFB_Sim.slx](Kalman_FSFB_Sim.slx). The result below shows that the estimation performance is good and the close loop system is stable.

<img width="1204" alt="Screen Shot 2020-07-13 at 8 19 10 PM" src="https://user-images.githubusercontent.com/56740627/87367439-ffe90580-c548-11ea-99b1-25e426984ad0.png"> <br/>

<p align="center">
  <img src="https://user-images.githubusercontent.com/56740627/87367454-0d9e8b00-c549-11ea-8ddd-ee53802a0937.jpg" width="550">
</p>

## 2. LQR demo
Matlab file [LQR_MSD.m](LQR_MSD.m) shows the implementation of tuning the weighting matrices Q and R to demonstrate the resulting control of the system. A simple full state model [LQR_Sim.slx](LQR_Sim.slx) is used in this case. The results of expensive control, cheap control and penalizing only the state vector are shown in the plot that shows how LQR helps in determining the feedback gain to push the CL system poles appropriately in contrast to the pole placement technique (acker, place commands in Matlab) that cannot do this.

<p align="center">
  <img width="669" alt="Screen Shot 2020-07-13 at 11 20 48 PM" src="https://user-images.githubusercontent.com/56740627/87380045-9cb69d80-c55f-11ea-93c5-3e1cee009f21.png"> <br/>
<p/>

### Cheap Control
Control is cheaper, so the states are driven to zero in a quick time (~4s)
<p align="center">
  <img src="https://user-images.githubusercontent.com/56740627/87380032-9aecda00-c55f-11ea-8214-63ec1bad211c.jpg" width="550"> <br/>
</p>

### Expensive Control
Control is not cheaper, so the states are driven to zero after a long time (~18s)
<p align="center">
  <img src="https://user-images.githubusercontent.com/56740627/87380039-9c1e0700-c55f-11ea-9117-dd220d5d2d36.jpg" width="550"> <br/>
</p>

### Penalizing velocity 
Penalizing state x2 heavily in comparison to x1 shows that the state x2 is driven to zero in a quick time, but the state x1 (displacement) takes longer than 20s to get to zero.
<p align="center">
  <img src="https://user-images.githubusercontent.com/56740627/87380043-9c1e0700-c55f-11ea-94a2-0a71db786e58.jpg" width="550"> <br/>
</p>


## 3. state_observer_controller & PID_Controller
The two models show control of a simple second order mass spring damper system using observer based controller & a PID controller

<img width="1152" alt="Observer_Controller" src="https://user-images.githubusercontent.com/56740627/71863487-034b9200-30cb-11ea-931f-776ef850fd51.png"> <br/>

<img width="1365" alt="PID_Controller" src="https://user-images.githubusercontent.com/56740627/71863489-03e42880-30cb-11ea-9c4d-0b2e046665e5.png"> <br/>

## 4. Cannon_Fire
This model shows the cannon fire simulation plotting the travel trajectory & x-y distances and x-y velocities 

<img width="1100" alt="Cannon_Fire" src="https://user-images.githubusercontent.com/56740627/71863486-034b9200-30cb-11ea-9c7d-70fd8c940d29.png">
