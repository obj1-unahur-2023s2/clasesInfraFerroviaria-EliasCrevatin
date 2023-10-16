import formaciones.*

class VagonDePasajeros {
	const property tieneBanio 
	var property estaOrdenado = true
	const property largo 
	const property ancho
	var property capacidadDePasajeros = 0
	
	
	method capacidad() = if (ancho <= 3) { 8 * largo } else { 10 * largo }
	
	method capacidadPasajeros() =
	if(!estaOrdenado) {0.max(self.capacidad() - 15)} else {self.capacidad()}
	
	method cargaMaxima() = if(!tieneBanio) {800} else {300}
	
	method pesoMaximo() = 2000 + 80 * self.capacidadPasajeros() + self.cargaMaxima()
	
	method esPopular() = self.pesoMaximo() >= 50
	
	method recibirMantenimiento() = if(!estaOrdenado) {self.estaOrdenado(true) } else {}
	
	method esDePasajeros() = capacidadDePasajeros > 0
	
}

class VagonDeCarga {
    const property tieneBanio = false
	var property maderasSueltas = 0
	var property cargaMaximaIdeal = 0
	var property estaOrdenado 
	 var property capacidadDePasajeros = 0
	 
	
	method cargaMaxima() = cargaMaximaIdeal - 400 * maderasSueltas 
	
	method capacidadDePasajeros() = 0
	
	method pesoMaximo() = 1500 + self.cargaMaxima()
	
	method esPopular() = self.pesoMaximo() >= 50
	
	method recibirMantenimiento() { maderasSueltas = 0.max(maderasSueltas - 2) }

	method esDePasajeros() = capacidadDePasajeros > 0

	
}

class VagonesDormitorio {
	const property  tieneBanio = true
	const property cargaMaxima = 1200
	var property compartimientos = 0
	var property camasPorCompartimiento = 0
	var property estaOrdenado 
	var property capacidadDePasajeros = 0
	
	
	method capacidadDePasajeros() = compartimientos * camasPorCompartimiento
	
	method pesoMaximo() = 4000 + 80 * self.capacidadDePasajeros() + cargaMaxima
	
	method esPopular() = self.pesoMaximo() >= 50
	
	method recibirMantenimiento() {}
	
	
	method esDePasajeros() = capacidadDePasajeros > 0
	

}
	
}
