# Simulate-it
Simulations of some simple systems demonstrating control systems basics using Simulink

## Kalman_LQR_Estimation_Control
The matlab file Kalman_FSFB.m shows the calculation for filter dynamics and LQR feedback gain. The simulink model is implemented in Kalman_FSFB_Sim.slx. The result below shows that the estimation performance is good and the close loop system is stable.

<img width="1204" alt="Screen Shot 2020-07-13 at 8 19 10 PM" src="https://user-images.githubusercontent.com/56740627/87367439-ffe90580-c548-11ea-99b1-25e426984ad0.png"> <br/>

<p align="center">
  <img src="https://user-images.githubusercontent.com/56740627/87367454-0d9e8b00-c549-11ea-8ddd-ee53802a0937.jpg" width="550">
</p>

## state_observer_controller & PID_Controller
The two models show control of a simple second order mass spring damper system using observer based controller & a PID controller

<img width="1152" alt="Observer_Controller" src="https://user-images.githubusercontent.com/56740627/71863487-034b9200-30cb-11ea-931f-776ef850fd51.png"> <br/>

<img width="1365" alt="PID_Controller" src="https://user-images.githubusercontent.com/56740627/71863489-03e42880-30cb-11ea-9c4d-0b2e046665e5.png"> <br/>

## Cannon_Fire
This model shows the cannon fire simulation plotting the travel trajectory & x-y distances and x-y velocities 

<img width="1100" alt="Cannon_Fire" src="https://user-images.githubusercontent.com/56740627/71863486-034b9200-30cb-11ea-9c7d-70fd8c940d29.png">
