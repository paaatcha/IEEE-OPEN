include <medidas.scad>

SUPORTE_MOTOR_VASSOURA_THICKNESS = 3;
SUPORTE_MOTOR_VASSOURA_HEIGHT = 50;
screw2Diameter = MOTOR_SCREW_MOTOR_DIAMETER;
diameterLength = MOTOR_LENGTH1;
diameter2Length = MOTOR_LENGTH2;


module hollowTube(outterDiameter, innerDiameter, height)
{
	difference()
	{
		cylinder(r=outterDiameter/2, h=height, center=true);	

		cylinder(r=innerDiameter/2, h=height+2, center=true);	
	}
}

module motorMountWall()
{
	cube([DISTANCE_BETWEN_THREADED_ROD, SUPORTE_MOTOR_VASSOURA_THICKNESS, SUPORTE_MOTOR_VASSOURA_HEIGHT],center=true);
}

module suporteMotorVassoura()
{
		innerDiameter = DIAMETER_THREADED_ROD + 0.2;
		outterDiameter = innerDiameter+2*SUPORTE_MOTOR_VASSOURA_THICKNESS;
		height = SUPORTE_MOTOR_VASSOURA_HEIGHT;

		difference()
		{
			union()
			{
				color([0,1,0])
				{
					hollowTube(outterDiameter, innerDiameter, height);
					translate([DISTANCE_BETWEN_THREADED_ROD,0,0])
					hollowTube(outterDiameter, innerDiameter, height);
					translate([DISTANCE_BETWEN_THREADED_ROD/2, (outterDiameter-SUPORTE_MOTOR_VASSOURA_THICKNESS)/2,0])
					motorMountWall();
				}
			}
			motorHoles();
		}
}

module motorHoles()
{
	translate([DISTANCE_BETWEN_THREADED_ROD/2,0,0])
	{
		rotate([90,90,0])
		{
			for(i=[1:6])
			{
				rotate([0,0,60*i])
				{
					translate([0,15.65,0])
					{
						cylinder (r=screw2Diameter/2,h= diameterLength,center=true,$fn=15);
					}
				}	
			}
			
			translate([7.4,0,0])
			{
				cylinder(r=MOTOR_LARGE_SHAFT_DIAMETER/2,h=20,center=true,$fn=20);
			}
		}
	}
}
