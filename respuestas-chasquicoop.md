# Remisería ChasquiCoop: respuestas

## 1. ¿Da igual que las colecciones de flota y viajes en la sucursal sean listas o conjuntos?

> Si piensas que no, cambia una implementación por la otra y revisa el resultado.

No, no es lo mismo. En este caso conviene que sea una lista: en un conjunto se perderían los repetidos (que no sería el caso) y el orden.

## 2. ¿Dónde se instancia un viaje, dentro o fuera de la clase Sucursal?

> Pensar cómo sería la alternativa.

En la sucursal se registra el viaje. Este método recibe la reserva y el vehículo, y así se hace una validación para armar el viaje.

## 3. ¿La combi es un objeto autodefinido o una instancia de clase? ¿Se puede usar la otra variante indistintamente?

La combi es un objeto autodefinido porque en el enunciado dice que es un vehículo único para toda la empresa.

Mientras que las clases sirven para generar varias instancias con la misma estructura, como es el caso de los torinos o los económicos.

Al saber que va a haber una sola, crear una clase está de más, ya que no se va a usar.

## 4. Diagramas

- Diagrama dinámico que muestra el estado final del último test.
- Diagrama estático con la relación entre los tipos Viaje, Reserva y Vehículo (y las entidades que las implementan).

Se adjunta el diagrama en la carpeta con el nombre Remisería ChasquiCoop.png