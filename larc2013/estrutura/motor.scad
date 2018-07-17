include <medidas.scad>

motorLength= MOTOR_LENGTH1 + MOTOR_LENGTH2; 
motorShaftDisplacement= [-7.4, 0 , motorLength/2]; 

module motor()
{
	color([0.7,0.7,0.7])
	{
		translate([0,0,MOTOR_LENGTH1/2])
		{
			cylinder(h = MOTOR_LENGTH2+0.015, r = MOTOR_DIAMETER2/2.0, center = true, $fn=50);
		}
	}
	color([0.5,0.5,0.5])
	{
		translate([0,0,-MOTOR_LENGTH2/2])
		{
			cylinder(h = MOTOR_LENGTH1, r = MOTOR_DIAMETER1/2.0, center = true, $fn=50);
		}
	}

	color([0.5,0.5,0.5])
	{
		scale([1,1,-1])
		{
			translate(motorShaftDisplacement)
			{
				cylinder(h = MOTOR_SHAFT_LENGTH, r = MOTOR_LARGE_SHAFT_DIAMETER/2, center=true, $fn=25);
			}
		}
	}

		color([0.8,0.8,0.8])
	{
		scale([1,1,-1])
		{
			translate(motorShaftDisplacement+[0,0,MOTOR_SHAFT_LENGTH])
			{
				eixo();
			}
		}
	}
}

module eixo ()
{
	rotate([0,0,360*$t])
	{
		difference()
		{
			cylinder(h = MOTOR_BIGGER_SHAFT_LENGTH, r = MOTOR_SHAFT_DIAMETER/2, center=true, $fn=20);
			translate([MOTOR_SHAFT_DIAMETER_CUT,0,0])
			{
				cube([MOTOR_SHAFT_DIAMETER,MOTOR_SHAFT_DIAMETER,1.1*MOTOR_BIGGER_SHAFT_LENGTH], center=true);
			}
		}
	}
}
