# prueba_keppri

A new Flutter project.

## Getting Started

## Requisitos previos

1. Tener instalado Flutter en sus dispositivos, en mi caso tengo la version 3.24.3
2. Tener android studio y el sdk para
3. Tener dart instalado, en mi caso tengo la version 3.5.3
4. configura un emulador de android studio o en un dispositivo fisico ponerlo en modo de desarrollo.

## clonacion del proyecto
para descargar el proyecto haremos lo siguiente: 

repositorio del proyecto: https://github.com/sebastian-monroy/prueba_keppri

1. abre tu cmd, terminal o linea de comandos exactamente en la raiz en donde este tu proyecto y ejecuta lo siguiente: 
    - git clone https://github.com/sebastian-monroy/prueba_keppri.git

2. Instalando dependencias
una vez tengan el proyecto clonado y descargado lo abren con visual studio code y para instalacion de dependencias abren la terminal dentro de la carpeta y ejecutan:
 ## flutter pub get

3. ejecución del proyecto después de que las dependencias les instale, ejecutan el proyecto en un dispositivo o emulador usando:
flutter run o simplemente dandole clic en run y luego en start debugin (f5)

## NOTA: tener configurado el entorno de flutter y un dispositivo fisico en modo developer o emulador de android studio

## Gestion de estado seleccionado
En este caso, quise utilizar provider como gestor de estado ya que por medio de este enfoque podemos simplificar todo el manejo de estado entre las pantallas, en donde se permite compartir los datos de manera eficiente y reactiva y permite implementar los metodos creados de una manera mas sencilla desde la UI; en donde por medio de notifyListeners se escucha los cambios en cada metodo creado.

## Desiciones Tecnicas 
1. Pantalla o step1: En la pantalla 1 tenemos el formulario en donde es requerido responder a las preguntas para asi habilitar el boton que nos permitira almacenar la informacion y pasar a la siguiente pantalla; si o si es requerido responder las preguntas, de lo contrario no se habilita el boton
2. Pantalla o step2: En la pantalla 2 tenemos las preguntas con opciones de respuestas si y no, en donde se uso el widget "ChoiceChip" en donde por medio de este se me permite hacer dicha seleccion de opciones, las cuales se manejan desde el provider junto con el resto de la logica de la aplicacion como tal. Dentro de la misma pantalla tenemos una funcion llamada _buildQuestion que es la que se encarga de construir este widget que sera propio de esa pantalla. Ademas, al terminar de diligenciar toda la informacion, se me abrira un showDialog que es una ventana de notificaciones que me indicara que la informacion se envio correctamente y al dar en aceptar me redireccionara a una pantalla de confirmacion.
3. Creamos widgets reutilizables como el appbar y el boton de siguiente con el fin de poder tener un codigo mas limpio y mas eficiente a la hora de entenderlo; esto es una buena practica de programacion ya que mas que limpieza es una manera sencilla a la hora de una modificacion dentro del codigo.

## responsividad
Para la responsividad de la aplicacion como tal use widgets como singlechildscrollview, paddings, layoutbuilder, y manejos de ancho y de alto con with y height que permitan una buena renderizacion en todo tipo de dispositivo y pantallas en donde se use la aplicacion.

## estructura del proyecto
 La estructura del proyecto es la siguiente:

    PRUEBA_KEPPRI/
        lib/
            providers/
                provider_state.dart
            screens/
                AnamnesisStep1.dart
                AnamnesisStep2.dart
                confirmation_screen.dart
            widgets/
                custom_appbar.dart
                custom_elevated_button.dart
            main.dart

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
