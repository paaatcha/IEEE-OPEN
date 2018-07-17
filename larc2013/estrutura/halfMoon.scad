include <medidas.scad>
ESPESSURA = 2*BASE_HOLE_DISTANCE;
RAIO_HALF_MOON = 160;

module anel(i,e)
{
	difference()
	{
		circle ($fn = 50,e);	
		circle ($fn = 50,i);
	}
}

module retangulo(x,y)
{
	scale([x,y])
	{
		square (1);
	}
}

module HalfMoon()
{
	difference()
	{
		square (RAIO_HALF_MOON+ESPESSURA);
		circle ($fn = 50,RAIO_HALF_MOON);
		anel(RAIO_HALF_MOON+ESPESSURA,10*RAIO_HALF_MOON);
		translate([BASE_HOLE_DISTANCE,RAIO_HALF_MOON+ESPESSURA/2])
		{
			//circle ($fn = 50,DIAMETER_THREADED_ROD/2);		
		}
	}

	rotate([0,0,-90])
	{
		difference()
		{
			retangulo (RAIO_HALF_MOON*0.82,RAIO_HALF_MOON+ESPESSURA);
			circle ($fn = 50,RAIO_HALF_MOON);
			translate([RAIO_HALF_MOON-BASE_HOLE_DISTANCE,RAIO_HALF_MOON-BASE_HOLE_DISTANCE])
			{
				circle ($fn = 50,DIAMETER_THREADED_ROD/2);		
			}
		}
	}
}



