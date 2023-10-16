import Vagones.*
import Locomotoras.*

object formacion {
	
	const formaciones = []
	const locomotoras = []
	
	method agregarVagon(unVagon){formaciones.add(unVagon)}
	method agregarLocomotora(unaLocomotora){formaciones.add(unaLocomotora)}
	
	method capacidadDePasajerosDeFormacion(tipoDeVagon) = tipoDeVagon.capacidadDePasajeros()
	
	method capacidadDePasajerosDeFormacion2() = formaciones.sum({v =>v.capacidadDePasajeros()}) 
	
	method cantidadDePopulares() = formaciones.count({v => v.esPopular()}) //se debe agregar a los vagones el metodo de si es popular.
	
	method recibeMantenimiento() = formaciones.forEach({v=>v.recibirMantenimiento()})
	
	method esFormacionCarguera() = formaciones.all({v => v.pesoMaximo() >= 1000})
	
	
	method vagonPesado() = formaciones.max({v => v.pesoMaximo()})
	method vagonMasLiviano() = formaciones.min({v=>v.pesoMaximo()})
	method dispersionDePeso() = self.vagonPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	
	method cantidadDeBanios() = formaciones.count({v => v.tieneBanio()})
	
	method vagonQueTieneMasPasajeros() = formaciones.max({v => v.capacidadDePasajeros()})
	method vagonQueTieneMenosPasajeros() = formaciones.min({v=>v.capacidadDePasajeros()})
	
	method estaEquilibrado() =
	 self.vagonQueTieneMasPasajeros().capacidadDePasajeros() -  self.vagonQueTieneMenosPasajeros().capacidadDePasajeros() <= 20
	
	method estaEquilibrada() {
		const pasajeros =self.vagonesSoloDePasajeros() 
		const maximo = pasajeros.max {f => f.capacidadDePasajeros() }
		const minimo = pasajeros.min {f => f.capacidadDePasajeros() }
		return maximo.capacidadDePasajeros() - minimo.capacidadDePasajeros() <= 20
	}
	method vagonesSoloDePasajeros() {
		return formaciones.filter { f => f.esDePasajeros()}
	}
	
	method estaOrganizada() {
		return not (1..formaciones.size()-1).any { 
			idx => not formaciones.get(idx-1).esDePasajeros() and formaciones.get(idx).esDePasajeros()
		}
	}
	
	method velocidadMaxima(){ 
		return locomotoras.min({l => l.velocidadMaxima()}).velocidadMaxima() }
		
	method velocidadMasLenta(){ 
		return locomotoras.min({l => l.velocidadMaxima()})}
	
	method esEficiente() = locomotoras.all({l => l.esEficiente()})
	
	method puedeMoverse() { return self.sumaDelArrastre() + self.sumaDePesos()}
	method puedeMoverseBis() = self.kilosDeEmpujeFaltantes() == 0
	
	method sumaDelArrastre(){ 
		return locomotoras.sum({l=>l.pesoArrastable()})}
		
	method sumaDePesos(){
		return 	self.pesoDeLocomotoras() + self.pesoDeVagones()
	}
		
	method pesoDeLocomotoras(){ 
		return locomotoras.sum({l => l.peso()})}
		
	method pesoDeVagones(){
		return formaciones.sum({v=>v.pesoMaximo()})
	}
	
	method kilosDeEmpujeFaltantes(){return 0.max(self.sumaDePesos() - self.sumaDelArrastre())}
	
	method vagonMasPesado() = formaciones.max({v=>v.vagonPesado()}).asSet()
	
	method esComplejo(){
		return self.unidadesDeLaFormacion() > 8 || self.sumaDePesos()
	}
	method unidadesDeLaFormacion(){
		return formaciones.size() + locomotoras.size()
	}
}

	