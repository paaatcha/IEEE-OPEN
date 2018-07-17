include <medidas.scad>

module vassoura()
{
	color([0,0.5,0.5])
	{
		rotate([90,0,0])
		{
			cylinder(r=10, h=300, center=true);
		}
	
		for(i=[0:3])
		{
			rotate([0,90*i,0])
			{
				translate([0,-60,0])
				cylinder(r=4, h=150);
				translate([0,-20,0])
				cylinder(r=4, h=150);
				translate([0, 20,0])
				cylinder(r=4, h=150);
				translate([0, 60,0])
				cylinder(r=4, h=150);
			}	
		}
	}
}
