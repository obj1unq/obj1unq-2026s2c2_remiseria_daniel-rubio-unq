
class Vehiculo {
  var property velocidad = 0
  var property capacidad = 0
  var property color = ""
  var property esRuidoso = false
  var property puedeTransportarSillaDeRuedas = false



  method speed() = velocidad

  method accelerate(amount) {
    speed = speed + amount
  }
}
//////////////////////////////////////////////////////
// ---------- Vehículo (clase abstracta) ----------
class Vehiculo {
  method capacidad()
  method velocidadMaxima()
  method color()
  method esRuidoso()
  method puedeLlevarSillas()
  method autonomia()
}

// ---------- Torino ----------
class Torino inherits Vehiculo {
  const color
  const velocidadMaxima
  const autonomia

  override method capacidad() = 4
  override method velocidadMaxima() = velocidadMaxima
  override method color() = color
  override method esRuidoso() = true
  override method puedeLlevarSillas() = false
  override method autonomia() = autonomia
}

// ---------- Económico ----------
class Economico inherits Vehiculo {
  const adaptaciones = #{}

  method agregarAdaptacion(adaptacion) {
    adaptaciones.add(adaptacion)
  }

  override method capacidad() =
    5 - adaptaciones.fold(0, { total, a => total + a.espacioOcupado() })

  override method velocidadMaxima() =
    adaptaciones.fold(120, { minima, a => minima.min(a.velocidadLimite()) })

  override method color() = "beige"

  override method esRuidoso() = !adaptaciones.any({ a => a.silenciaMotor() })

  override method puedeLlevarSillas() = adaptaciones.any({ a => a.permiteSillas() })

  override method autonomia() =
    adaptaciones.fold(200, { total, a => total + a.autonomiaAportada() })
}

// ---------- Adaptaciones (objetos sin estado, polimórficos) ----------
object transportadorSillaRuedas {
  method espacioOcupado() = 1
  method velocidadLimite() = 90
  method permiteSillas() = true
  method silenciaMotor() = false
  method autonomiaAportada() = -20
}

object canioEscapeSilencioso {
  method espacioOcupado() = 0
  method velocidadLimite() = 115
  method permiteSillas() = false
  method silenciaMotor() = true
  method autonomiaAportada() = -10
}

object tanqueExtraGas {
  method espacioOcupado() = 1
  method velocidadLimite() = 80
  method permiteSillas() = false
  method silenciaMotor() = true
  method autonomiaAportada() = 200
}

// ---------- Combi adaptable (única en toda la empresa) ----------
object combi inherits Vehiculo {
  var interior = interiorAccesible
  var motor = motorUrbano

  method cambiarInterior(nuevoInterior) {
    interior = nuevoInterior
  }

  method cambiarMotor(nuevoMotor) {
    motor = nuevoMotor
  }

  override method capacidad() = interior.capacidad()
  override method puedeLlevarSillas() = interior.permiteSillas()
  override method velocidadMaxima() = motor.velocidadMaxima()
  override method autonomia() = motor.autonomia()
  override method esRuidoso() = motor.esRuidoso()
  override method color() = "celeste"
}

// ---------- Interiores ----------
object interiorEspacioso {
  method capacidad() = 7
  method permiteSillas() = false
}

object interiorAccesible {
  method capacidad() = 5
  method permiteSillas() = true
}

// ---------- Motores ----------
object motorDeportivo {
  method autonomia() = 400
  method velocidadMaxima() = 230
  method esRuidoso() = true
}

object motorUrbano {
  method autonomia() = 1000
  method velocidadMaxima() = 130
  method esRuidoso() = false
}
