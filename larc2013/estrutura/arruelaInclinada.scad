include <medidas.scad>

module hollowTube(outterDiameter, innerDiameter, height)
{
	difference()
	{
		cylinder(r=outterDiameter/2, h=height, center=true);	

		cylinder(r=innerDiameter/2, h=height+2, center=true);	
	}
}

module arruelaInclinadaParam(diameter, angle)
{
	innerDiameter = diameter;
	outterDiameter = diameter+2*ARRUELA_INCLINADA_WALL_THICKNESS;
	height = outterDiameter*tan(angle) + 2*ARRUELA_INCLINADA_EXTRA_HEIGHT;
	negativeCube = max(height*2, outterDiameter*2);
	h = 0;

	difference()
	{
		hollowTube(outterDiameter, innerDiameter, height);
		
		translate([0,0,h])
		{
			rotate([angle, 0, 0])
			{
				translate([0,0,negativeCube/2])
				{
					cube([negativeCube,negativeCube,negativeCube], center=true);
				}
			}
		}
	}
}

module arruelaInclinada()
{
	color([1,0.4,0])
	{
		arruelaInclinadaParam(DIAMETER_THREADED_ROD, RAMP_ANGLE);
	}
}

arruelaInclinada();