import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Persona {
  late String nombre;
  late String apellidos;
  late String carrera;

  Persona(this.nombre, this.apellidos, this.carrera);

  @override
  String toString() {
    return 'Nombre: $nombre\nApellidos: $apellidos\nCarrera: $carrera\n';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    Persona nuevaPersona = obtenerInformacionPersona();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', persona: nuevaPersona),
    );
  }

  Persona obtenerInformacionPersona() {
    String nombre =
        'John'; // Valor predeterminado si el usuario no ingresa datos
    String apellidos =
        'Doe'; // Valor predeterminado si el usuario no ingresa datos
    String carrera =
        'Informática'; // Valor predeterminado si el usuario no ingresa datos

    // Solicitar al usuario que ingrese los datos para crear una persona
    // Los datos ingresados por el usuario reemplazarán los valores predeterminados
    // cuando se introduzcan.
    // Puedes usar widgets de diálogo o de formulario para esto, pero aquí se usan valores predeterminados.
    // Supondré que estás recopilando esta información de alguna manera, por ejemplo, mediante widgets TextFormField.

    return Persona(nombre, apellidos, carrera);
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Persona persona;

  const MyHomePage({Key? key, required this.title, required this.persona})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Persona:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              widget.persona.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
