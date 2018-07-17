

CONNECTOR_HEIGHT = 10;

module nut()
{
	//cylinder(r=3.25, h=2.5, center=true);
	cube([3.5,7,10], center=true);
}

module nutTrap()
{
	nut();

	rotate([0,90,0])
		cylinder(r=1.8, h=15, center=true);
	
}


module shaft6()
{
	cylinder(r=3, h=2*CONNECTOR_HEIGHT, center=true);
}

module shaft3()
{
	cylinder(r=1.5, h=2*CONNECTOR_HEIGHT, center=true);
}

module wheelAdapter()
{
	difference()
	{
		union()
		{
			translate([0,0,-2])
			{
				rotate([0,0,45])
				{
					cube([80,10,6],center=true);			
					cube([10,80,6],center=true);			
				}
			}

			cylinder(r=14, h=CONNECTOR_HEIGHT, center=true);
		}

		translate([7,0,1])
			nutTrap();

		rotate([0,0,90])
		{
			translate([7,0,1])
				nutTrap();
		}

		shaft6();

		rotate([0,0,45])
		{
			translate([35,0,0])
				shaft3();
			translate([-35,0,0])
				shaft3();
			translate([0,35,0])
				shaft3();
			translate([0,-35,0])
				shaft3();
		}
	}
}

wheelAdapter();