ESPESSURA =10;
RAIO =150;
PARAFUSO = 6.35;

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
		square (RAIO+ESPESSURA);
		circle ($fn = 50,RAIO);
		anel(RAIO+ESPESSURA,10*RAIO);
		translate([circle ($fn = 50,RAIO);
	}

	rotate([0,0,-90])
	{
		difference()
		{
			retangulo (RAIO+0.5,RAIO+ESPESSURA);
			circle ($fn = 50,RAIO);
		}
	}
}
