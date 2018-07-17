# IEEE OPEN

The IEEE OPEN is a category of the Latin American Robotic Competition (LARC) in which is allowed to use anything in order to solve a given challenge. In 2013, I led a team with 9 students that participated in this competition in Arequipa, Peru. The competition's rule is described in [this document](). In brief, we needed to develop an **autonomous beach cleaner robot**. This robots had to perform in the simulated arena depicted below:

![arena](colocar)

The robot was entirely designed on the 3D software [OpenScad](http://opensacad.org) and its physical structure was composed of acrylic and 3D printed pieces. In [estrutura folder](https://github.com/paaatcha/IEEE-OPEN/tree/master/larc2013/estrutura) you can see all designed parts.

![3D](colocar)

![real](colocar)

In order to "see" the environment, we used an Android smartphone embedded in the robot and all computer vision was processed on the own Android. We needed to do it for two main reasons: first, we didn't have money to afford a good camera; second, it was an elegant solution since the smartphone fitted perfectly in the robot. To control motors, servo motors, and ultrasonic sensors, we used an Arduino Mega. In brief, the working flow was: the Android gets information for the world through its camera, process it and send the commands to the Arduino. 

To put everything together, we developed a PCB that you can find on [eletronica folder](https://github.com/paaatcha/IEEE-OPEN/tree/master/larc2013/eletronica).

![3D](placa)

All code developed to this project is avalaible on [programacao folder](https://github.com/paaatcha/IEEE-OPEN/tree/master/larc2013/programacao). We used C/C++ and Java to programmed all parts.

A curious and sad thing that happened to us when we were traveling to Peru was that the airplane company has lost our luggage with many parts of the robot. Therefore, a day and a half before the competition starts, we needed to reconstruct the whole robot from almost scratch. Luckily, all electronic parts arrived, however, we've lost some motors. What we did was buy a lot of things in the local market to reconstruct the robot. Even with this, we were able to get the 2nd place out of 19 teams. No doubt, it was the most exciting story of my life.

The robot version at the competition:

![robo](colocar)

The team after the 2nd place in the competition:

![team](colocar)

Take a look at the robot perfoming in the competition:

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/20euAUzxxZE/0.jpg)](https://www.youtube.com/watch?v=20euAUzxxZE)


