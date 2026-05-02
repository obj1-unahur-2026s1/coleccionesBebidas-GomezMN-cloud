object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {
  const recipiente = []

  method agregarIngrediente(ingrediente) = recipiente.add(ingrediente)
  method rendimientoQueOtorga(dosisConsumida) = (dosisConsumida * recipiente.sum({c => c.nutriente()})) / 1000
}

object aguaSaborizada {
  var bebidaActual = terere

  method cambiarSabor(nuevaBebida){
    bebidaActual = nuevaBebida
  }
  method rendimientoQueOtorga(dosisConsumida) {
    return 1 + bebidaActual.rendimientoQueOtorga(dosisConsumida * 0.25)
  } 
}

object coctel {
  const recipiente = []

  method agregarIngrediente(ingrediente) = recipiente.add(ingrediente)
  method rendimientoQueOtorga(dosisConsumida) = recipiente.fold(1, {acum, item => acum * item.rendimientoQueOtorga(dosisConsumida / self.cantidadDeIngredientes())})
  method cantidadDeIngredientes() {
    return recipiente.size()
  }
}

object agua {
  method rendimientoQueOtorga(dosisConsumida) = 1 
}
object leche {
  method rendimientoQueOtorga(dosisConsumida) = 0.8
}
object pera {
  method rendimientoQueOtorga(dosisConsumida) = 0.3
}
object hielo {
  method rendimientoQueOtorga(dosisConsumida) = 0 
}