
CONNECTOR_HEIGHT = 15;

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

module shaft8()
{
	translate([0,0,CONNECTOR_HEIGHT/2])
		cylinder(r=4, h=CONNECTOR_HEIGHT, center=true);
}

module shaft5()
{
	cylinder(r=2.5, h=2*CONNECTOR_HEIGHT, center=true);
}

module AxisConnector()
{
	difference()
	{
		cylinder(r=12, h=CONNECTOR_HEIGHT, center=true);

		translate([7,0,3])
			nutTrap();

		translate([-7,0,3])
			nutTrap();


		rotate([0,0,90])
		{
			translate([-7,0,-3])
				nutTrap();

			translate([7,0,-3])
				nutTrap();
		}

		shaft8();
		shaft5();
	}
}

AxisConnector();