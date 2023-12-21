import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Creamos una clase llamada "Persona" para almacenar información sobre una persona.
class Persona {
  late String nombre;
  late String apellidos;
  late String carrera;
  late int edad;

  // Creamos un constructor para inicializar una Persona con nombre, apellidos, carrera y edad.
  Persona(this.nombre, this.apellidos, this.carrera, this.edad);

  // Creamos un método de fábrica (factory method) para crear una Persona con edad verificada.
  factory Persona.conEdad(
      String nombre, String apellidos, String carrera, int edad) {
    // Verificamos que la edad esté entre 0 y 150 años.
    if (edad < 0 || edad > 150) {
      throw ArgumentError('La edad debe estar entre 0 y 150 años.');
    }

    // Si la edad está dentro del rango, creamos y devolvemos una Persona.
    return Persona(nombre, apellidos, carrera, edad);
  }

  // Creamos un método para mostrar la información de la Persona en formato de texto.
  @override
  String toString() {
    return 'Nombre: $nombre\nApellidos: $apellidos\nCarrera: $carrera\nEdad: $edad años\n';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Persona? nuevaPersona; // Creamos una variable para almacenar una Persona.

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Método para mostrar un cuadro de diálogo para ingresar los datos de la Persona.
  Future<void> _mostrarDialogo() async {
    // Creamos controladores para obtener los datos ingresados en los campos de texto.
    TextEditingController nombreController = TextEditingController();
    TextEditingController apellidosController = TextEditingController();
    TextEditingController carreraController = TextEditingController();
    TextEditingController edadController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ingresa tus datos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Campos de texto para ingresar nombre, apellidos, carrera y edad.
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: apellidosController,
                  decoration: const InputDecoration(labelText: 'Apellidos'),
                ),
                TextFormField(
                  controller: carreraController,
                  decoration: const InputDecoration(labelText: 'Carrera'),
                ),
                TextFormField(
                  controller: edadController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Edad'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // Botón de aceptar que guarda la nueva Persona con los datos ingresados.
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                setState(() {
                  // Creamos una nueva Persona con los datos ingresados.
                  nuevaPersona = Persona.conEdad(
                    nombreController.text,
                    apellidosController.text,
                    carreraController.text,
                    int.parse(edadController.text),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:', // Mensaje de contador.
            ),
            Text(
              '$_counter', // Muestra el contador.
              style: Theme.of(context).textTheme.headline6,
            ),
            if (nuevaPersona != null) ...[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  nuevaPersona!
                      .toString(), // Muestra la información de la Persona.
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogo(); // Muestra el diálogo para ingresar datos de la Persona.
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
