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

  late PizzeriaClient stub;

  Future<void> sendRequest() async {
    final channel = ClientChannel('mypython.koreasouth.cloudapp.azure.com',
        port: 50051,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = PizzeriaClient(channel,
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
