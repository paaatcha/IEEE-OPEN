include <base.scad>
include <inclinacao.scad>
include <medidas.scad>
include <arruelaInclinada.scad>
include <motorRoda.scad>
include <suporteMotorVassoura.scad>
include <suporteRolamentoVassoura.scad>
include <vassoura.scad>
include <halfMoon3D.scad>

module suportesVassoura()
{
	dx = -RAMP_LENGTH/2 + BASE_HOLE_DISTANCE;
	dy = RAMP_WIDTH/2 - BASE_HOLE_DISTANCE;
	dz = VASSOURA_HEIGHT;

	translate([dx,dy,dz])
	suporteMotorVassoura();

	translate([dx,-dy,dz])
	scale([1,-1,1])
	suporteRolamentoVassoura();

}

module posicionaVassoura()
{
	dx = -RAMP_LENGTH/2 + BASE_HOLE_DISTANCE + DISTANCE_BETWEN_THREADED_ROD/2;
	dy = 0;
	dz = VASSOURA_HEIGHT;

	translate([dx,dy,dz])
	rotate([0,360*$t,0])
	vassoura();
}

module arruelaPos()
{
	rotate([0,0,90])
	{
		arruelaInclinada();
	}	
	translate([0,0,ACRYLIC_THICKNESS])
	{
		rotate([0,180,-90])
		{
			arruelaInclinada();
		}	
	}
}

module posArruela()
{
	translate([comprimentoBase/2-distanciaFuroBase,larguraBase/2-distanciaFuroBase,distanciaFuroBase*tan(angRampa)+alturaTras])
	{
		arruelaPos();	
	}
	
	translate([-comprimentoBase/2+distanciaFuroBase,larguraBase/2-distanciaFuroBase,(comprimentoBase-distanciaFuroBase)*tan(angRampa)-distanciaFuroBase*tan(angRampa)+alturaTras])
	{
		arruelaPos();
	}
	

	translate([-comprimentoBase/2+distanciaFuroBase+distanciaEntreParafusos,larguraBase/2-distanciaFuroBase,(comprimentoBase-distanciaFuroBase-diametroParafusoBase-distanciaEntreParafusos)*tan(angRampa)-distanciaFuroBase*tan(angRampa)+alturaTras])
	{
		arruelaPos();
	}
}

module posicionaHalfMoon()
{
	translate([-100, 0, 60])
	{
		halfMoon3D();
	}
}

module rampa ()
{
	posArruela();

	mirror([0,1,0])
	{
		posArruela();
	}	
	
	posRoda();

	mirror([0,1,0])
	{
		posRoda();
	}
	

	suportesVassoura();
	posicionaVassoura();
	inclinacao ();
	base();
	posicionaHalfMoon();

}

module posRoda()
{	
	scale([-1,1,1])
	{
		translate([BASE_LENGTH-RAMP_LENGTH/2-BACK_MOTOR_DISTANCE,RAMP_WIDTH/2-suporteMotorLength/2-3,-7.4-ACRYLIC_THICKNESS/2-1.5])
		{
			rotate([0,-90,-90])
			{
				motorRoda();
			}
		}
		translate([-RAMP_LENGTH/2+FRONT_MOTOR_DISTANCE,RAMP_WIDTH/2-suporteMotorLength/2-3,-7.4-ACRYLIC_THICKNESS/2-1.5])
		{
			rotate([0,-90,-90])
			{
				motorRoda();
			}
		}
	}
}
