include <medidas.scad>

diameter = MOTOR_DIAMETER1;
diameter2 = MOTOR_DIAMETER2;
diameterLength = MOTOR_LENGTH1;
diameter2Length = MOTOR_LENGTH2;
shaftLength = MOTOR_SHAFT_LENGTH;
suporteMotorLength = diameterLength + diameter2Length; 
shaftDiameter = MOTOR_SHAFT_DIAMETER;
largeShaftDiameter = MOTOR_LARGE_SHAFT_DIAMETER;
suporteMotorShaftDisplacement = [-7.4, 0 , suporteMotorLength/2]; 
screwDiameter = MOTOR_SCREW_SUPORT_DIAMETER;
screw2Diameter = MOTOR_SCREW_MOTOR_DIAMETER;
pinDiameter = 20;
pinHeight = 10;
zipLockThickness = MOTOR_ZIPLOCK_THICKNESS;
zipLockWidth = MOTOR_ZIPLOCK_WIDITH; 

module motormount()
{	
	color([1,0.4,0])
	{
		difference()
		{
			union()
			{
				rotate([0,180,0])
				{
					difference()
					{
						union()
						{
							rotate([0, 90, 0])
							{
								printCube(suporteMotorLength +6, diameter+5,(diameter/2) +5 , 5);
							}
							translate([diameter/2-8,0,-suporteMotorLength/2-1])
							cube([4,diameter+5,4],center=true);
						}
						translate([10, 0, 0])
						{
							motorSpace();
						}
					}
				}
	
				screwSupport(-20);
				screwSupport(20);
			}
			translate([-10,0,20])
			{
				ring((diameter/2)+2.5, zipLockThickness, zipLockWidth);
			}
			translate([-10,0,-20])
			{
				ring((diameter/2)+2.5, zipLockThickness, zipLockWidth);
			}
		}
	}
}

module ring(radius, thickness, width)
{
	difference()
	{
		cylinder(r= radius+thickness, h = width, center=true, $fn=50);
		cylinder(r= radius, h= width*2, center=true, $fn=50);
	}
}

module uHole(radius, height)
{
	cubeLength = 1000;
	cylinder(h = height, r = radius, center=true, $fn=50);
	translate([cubeLength/2, 0, 0])
	{
		cube([cubeLength, 2*radius, height], center=true);
	}
}

module triangle(cateto, width)
{
	rotate([0, 0, 90])
	{
		difference()
		{
			cube([cateto, cateto, width], center = true);

			translate([cateto/2, cateto/2, 0])
			{
				rotate([0, 0, 45])
				{
					cube([cateto*sqrt(2), cateto*sqrt(2), width+1], center=true);
				}
			}
		}
	}
}

module screwSupportTriangle(z)
{
	translate([5.25, diameter-10, z])
	{
		triangle(13, 10);
	}

	scale([1,-1,1])
	{
		translate([5.25, diameter-10, z])
		{
			triangle(13, 10);
		}
	}
}

module screwSupportCube(z)
{
	translate([0, diameter-15, z-3])
	{
		cube([10, 10, 6]);
	}

	scale([1,-1,1])
	{
		translate([0, diameter-15, z-3])
		{
			cube([10, 10, 6]);
		}
	}
}
module screwSupportCylinder(z)
{
	translate([0, diameter-10, z])
	{
		rotate([0, 90, 0])
		{
			cylinder(h = 15, r = screwDiameter/2, $fn=20);
		}
	}
	scale([1,-1,1])
	{
		translate([0, diameter-10, z])
		{
			rotate([0, 90, 0])
			{
				cylinder(h = 15, r = screwDiameter/2, $fn=20);
			}
		}
	}
}

module screwSupport(z, screwDiameter)
{
	difference()
	{
		difference()
		{
			screwSupportTriangle(z);
			screwSupportCube(z);
		}
		translate([0,0,-0.3])
		{
			rotate([45,45,-135])
			{
				cube([d,d,d], center =true);
			}
		}
		
		screwSupportCylinder(z);
		
		translate([0,((diameter+5)/2)+13,-5+z])
		{
			rotate([45,0,0])
			{
				cube([300,3,3], center =true);
			}
		}
			
		translate([0,((diameter+5)/2)+13,5+z])
		{
			rotate([45,0,0])
			{
				cube([300,3,3], center =true);
			}
		}

		translate([0,-((diameter+5)/2)-13,-5+z])
		{
			rotate([45,0,0])
			{
				cube([300,3,3], center =true);
			}
		}
			
		translate([0,-((diameter+5)/2)-13,5+z])
		{
			rotate([45,0,0])
			{
				cube([300,3,3], center =true);
			}
		}
	}
}

module motorSpace()
{
	translate([0,0,diameterLength/2])
	{
		cylinder(h = diameter2Length+0.015, r = diameter2/2.0, center = true, $fn=50);
	}

	translate([0,0,-diameter2Length/2])
	{
		cylinder(h = diameterLength, r = diameter/2.0, center = true, $fn=50);
	}

	color([1.0,0,0])
	{
		translate(suporteMotorShaftDisplacement)
		{
			uHole(radius=largeShaftDiameter/2, height=10);
		}

		scale([1,1,-1])
		{
			translate(suporteMotorShaftDisplacement)
				{
					uHole(radius=largeShaftDiameter/2, height=10);
				}
		}
		for(i=[1:6])
		{
		rotate([0,0,60*i])
			{
				translate([0,15.65,-diameter2Length])
				{
				cylinder (r=screw2Diameter/2,h= diameterLength,center=true,$fn=15);
				}
			}	
		}
	}
}

module printCube(a,b,c,d)
{
	translate([a,b,c]/-2)
	difference()
	{
	cube([a,b,c]);
	
	translate([0,0,-0.2*d])
	rotate([45,45,-135])
	cube([d,d,d], center =true);

	translate([0,b,-0.2*d])
	rotate([45,45,135])
	cube([d,d,d], center =true);

	translate([a,b,-0.2*d])
	rotate([45,45,45])
	cube([d,d,d], center =true);

	translate([a,0,-0.2*d])
	rotate([45,45,-45])
	cube([d,d,d], center =true);
	}
}

rotate([0,90,0])
motormount();
