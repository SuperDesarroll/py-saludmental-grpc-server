import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:saludmental/generated/servicio.pb.dart';
import 'package:saludmental/generated/servicio.pbgrpc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PreguntasPage(),
    );
  }
}

class PreguntasPage extends StatefulWidget {
  @override
  _PreguntasPageState createState() => _PreguntasPageState();
}

class _PreguntasPageState extends State<PreguntasPage> {
  int desinteresValue = 0;
  int fracasadoValue = 0;
  int irritadoValue = 0;

  bool buscando = false;

  List<String> opciones = [
    '-',
    'Casi todos los días',
    'Más de la mitad de los días',
    'Para Nada / Ningún día',
    'Varios días'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preguntas Salud Mental'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Desinterés diversión:',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  value: desinteresValue,
                  items: _getDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      desinteresValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Fracasado:',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  value: fracasadoValue,
                  items: _getDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      fracasadoValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Irritado:',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  value: irritadoValue,
                  items: _getDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      irritadoValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 30.0),
              predice == "-"
                  ? Center(
                      child: Icon(
                        Icons.volunteer_activism,
                        size: 150,
                        color: Colors.green,
                      ),
                    )
                  : Center(
                      child: Icon(
                        predice == "0"
                            ? Icons.sentiment_very_satisfied
                            : Icons.sentiment_very_dissatisfied,
                        size: 150,
                        color: predice == "0" ? Colors.green : Colors.orange,
                      ),
                    ),
              Center(
                child: buscando && predice != "-"
                    ? CircularProgressIndicator()
                    : SizedBox(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: sendRequest,
          tooltip: 'Increment',
          child: const Icon(Icons.smart_toy),
        ));
  }

  String predice = "-";

  late SaludMentalClient stub;

  Future<void> sendRequest() async {
    setState(() {
      buscando = true;
    });
    final channel = ClientChannel('mypython.koreasouth.cloudapp.azure.com',
        port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = SaludMentalClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    try {
      Encuesta nueva = Encuesta();
      nueva.desinteresDiversion =
          Int64(desinteresValue); // especifica directamente el valor como Int64
      nueva.fracasado = Int64(fracasadoValue);
      nueva.irritado = Int64(irritadoValue);

      var response = await stub.registerEncuesta(nueva);
      predice = response.prediccion.toString();
      setState(() {
        buscando = false;
      });
    } catch (e) {
      setState(() {
        buscando = false;
      });
    }
  }

  List<DropdownMenuItem<int>> _getDropdownItems() {
    return opciones
        .asMap()
        .entries
        .map((entry) => DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            ))
        .toList();
  }
}

/*
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:saludmental/generated/servicio.pb.dart';
import 'package:saludmental/generated/servicio.pbgrpc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String predice = "";

  late SaludMentalClient stub;

  Future<void> sendRequest() async {
    final channel = ClientChannel('mypython.koreasouth.cloudapp.azure.com',
        port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = SaludMentalClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    try {
      Encuesta nueva = Encuesta();
      nueva.desinteresDiversion =
          Int64(1); // especifica directamente el valor como Int64
      nueva.fracasado = Int64(0);
      nueva.irritado = Int64(0);

      var response = await stub.registerEncuesta(nueva);
      predice = response.prediccion.toString();
      setState(() {});
    } catch (e) {
      setState(() {});
    }
  }

  conectar() {}

  void _incrementCounter() {
    setState(() {
      sendRequest();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter' + ' predice = ' + predice.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/