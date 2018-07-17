include <medidas.scad>

espessuraAcrilico = ACRYLIC_THICKNESS;
larguraBase = RAMP_WIDTH;
comprimentoBase = RAMP_LENGTH;
angRampa = RAMP_ANGLE;
alturaTras = MINIMUM_DISTANCE_RAMP_BASE;
diametroParafusoBase = DIAMETER_THREADED_ROD;
distanciaFuroBase = BASE_HOLE_DISTANCE;
alturaParafusoBase = THREADED_ROD_NUT_HEIGTH;
alturaParede = RAMP_WALL_HEIGTH;
alturaArruela = ARRUELA_INCLINADA_EXTRA_HEIGHT;
distanciaEntreParafusos = DISTANCE_BETWEN_THREADED_ROD;

module parede()
{
	rotate([90,0,0])
	{
		linear_extrude(height=espessuraAcrilico)
		{ 
			polygon(points=[[0,0],[0,alturaParede],[comprimentoBase,-comprimentoBase*tan(angRampa)+alturaParede],[comprimentoBase,-comprimentoBase*tan(angRampa)]]);
		}
	}
}

module parafusosRampa()
{
	color([0.9,0.9,0.9])
	{
		translate([comprimentoBase/2-distanciaFuroBase,larguraBase/2-distanciaFuroBase,-espessuraAcrilico/2-alturaParafusoBase])
		{
			cylinder(r=diametroParafusoBase/2,h= distanciaFuroBase*tan(angRampa)+alturaTras+alturaArruela+2*alturaParafusoBase+2*espessuraAcrilico);	
		}
		translate([-comprimentoBase/2+distanciaFuroBase,larguraBase/2-distanciaFuroBase,-espessuraAcrilico/2-alturaParafusoBase])
		{
			cylinder(r=diametroParafusoBase/2,h= (comprimentoBase-distanciaFuroBase)*tan(angRampa)+alturaArruela+distanciaFuroBase*tan(angRampa)+alturaTras+2*alturaParafusoBase+2*espessuraAcrilico);
		}
		translate([-comprimentoBase/2+distanciaFuroBase+distanciaEntreParafusos,larguraBase/2-distanciaFuroBase,-espessuraAcrilico/2-alturaParafusoBase])
		{
			cylinder(r=diametroParafusoBase/2,h= (comprimentoBase-distanciaFuroBase-diametroParafusoBase-distanciaEntreParafusos)*tan(angRampa)+alturaArruela+distanciaFuroBase*tan(angRampa)+alturaTras+2*alturaParafusoBase+2*espessuraAcrilico);
		}
	}	
}

module rampPlate()
{
	difference()
	{
		cube([comprimentoBase/cos(angRampa),larguraBase,espessuraAcrilico], center= true );
		
		translate([-200,-60,0])
		cube([500, 15, 100], center=true);
		translate([-200,-20,0])
		cube([500, 15, 100], center=true);
		translate([-200, 20,0])
		cube([500, 15, 100], center=true);
		translate([-200, 60,0])
		cube([500, 15, 100], center=true);
	}
}


module inclinacao()
{
	color([0.5,0.5,0.5,0.5])
	{
		translate([-comprimentoBase/2,larguraBase/2-2*distanciaFuroBase,comprimentoBase*tan(angRampa)+alturaTras])
		{
			parede();
		}

		translate([-comprimentoBase/2,-larguraBase/2+2*distanciaFuroBase+espessuraAcrilico,comprimentoBase*tan(angRampa)+alturaTras])
		{
			parede();
		}

		translate([0,0,comprimentoBase/2*tan(angRampa)+alturaTras])
		{
			rotate([0,angRampa,0])
			{
				rampPlate();
			}
		}

	}

	parafusosRampa();

	mirror([0,1,0])
	{
		parafusosRampa();
	}

}
