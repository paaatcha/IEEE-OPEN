include <medidas.scad>

SUPORTE_MOTOR_VASSOURA_THICKNESS = 3;
SUPORTE_MOTOR_VASSOURA_HEIGHT = 50;
SCREW_DIAMETER = 8;
ROLAMENTO_DIAMETER = 22;
ROLAMENTO_LENGTH = 8;

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

module suporteRolamentoVassoura()
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
					rolamentoHole(outterDiameter);
				}
			}
			screwHole();
		}
}

module screwHole()
{
	translate([DISTANCE_BETWEN_THREADED_ROD/2,0,0])
	{
		rotate([90,0,0])
		{
			cylinder(r=SCREW_DIAMETER/2, h=20, center=true, $fn=15);
		}
	}
}

module rolamentoHole(outterDiameter)
{
	translate([DISTANCE_BETWEN_THREADED_ROD/2,((outterDiameter-SUPORTE_MOTOR_VASSOURA_THICKNESS)/2) - ROLAMENTO_LENGTH/2,0])
	{
		rotate([90,0,0])
		{
			difference()
			{
				cylinder(r=ROLAMENTO_DIAMETER/1.5, h=ROLAMENTO_LENGTH, center=true);
				cylinder(r=ROLAMENTO_DIAMETER/2, h=ROLAMENTO_LENGTH+1, center=true);
			}
		}
	}
}
