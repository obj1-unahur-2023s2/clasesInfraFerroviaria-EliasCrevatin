import formaciones.*

class Deposito {
	const formaciones = []
	const locomotoras = []
	
	method vagonesMasPesados(){ 
		return formaciones.map({f=>f.vagonMasPesado()}).asSet()
		}
	
	method necesitaConductorEzperimentado(){
		return formaciones.any({f=>f.esComplejo()})
	}
	
	
}
