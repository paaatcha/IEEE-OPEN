include <medidas.scad>
include <halfMoon.scad>

module halfMoon3DSlice()
{
	linear_extrude(height = ACRYLIC_THICKNESS, center = true, convexity = 10, twist = 0)
	HalfMoon();
}

module halfMoon3D()
{
	rotate([90,0,180])
	{
		for(i=[-2:2])
		{
			translate([0,0,40*i])
			{
				halfMoon3DSlice();
			}
		}
	}
}

//halfMoon3D();
