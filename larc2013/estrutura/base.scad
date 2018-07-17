include<medidas.scad>
include<paredeBase.scad>

compBase= BASE_WIDTH-(2*BASE_HOLE_DISTANCE);

module partBase ()
{
	translate([RAMP_LENGTH/2,RAMP_WIDTH/2,ACRYLIC_THICKNESS/2])
	{
		linear_extrude(height=ACRYLIC_THICKNESS)
		{
			polygon(points=[[0,0],[0,-(2*BASE_HOLE_DISTANCE)],[-(compBase/tan(FUNNEL_ANGLE)),-BASE_WIDTH],[-BASE_LENGTH,-BASE_WIDTH],[-BASE_LENGTH,0]]);
		}
	}
}

module base()
{
	color([0.5,0.5,0.5,0.5])
	{
		partBase();
	
		mirror([0,1,0])
		{
			partBase();
		}
		paredeBase();
	}
}

