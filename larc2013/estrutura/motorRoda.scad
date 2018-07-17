include <motor.scad>
include <suporteMotor.scad>
include <medidas.scad>

module suporteMotor ()
{
	motormount();
	translate([-MOTOR_DIAMETER1/4,0,0])
	rotate([0,180,180])
	{
		motor();
	}
}

module motorRoda()
{
	suporteMotor();
	translate([-MOTOR_DIAMETER1/4-7.4,0,(MOTOR_LENGTH1+MOTOR_LENGTH2)/2+MOTOR_BIGGER_SHAFT_LENGTH/2+WHEEL_WIDTH/2])
	{
		rotate([-90-360*$t,-90,0])
		{
			scale([1000,1000,1000])
			{
				color([0.9,0.9,0.6])
				{
					import ("Roda.stl");
				}
			}
		}
	}
}
