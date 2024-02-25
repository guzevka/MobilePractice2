import 'package:flutter/material.dart';

class Model {
  final String name;
  final int? age;
  final Model? model;
  Model({this.model, required this.name, this.age});
}

void main() {
  runApp(const MyApp());

// String
// int
// double
// List
// Map
// Set
// Object?

  Map<String, dynamic> response = {};

  final int age = response['age'] ?? 0;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Model model;

  int _counter = 0;

  @override
  void initState() {
    model = Model(name: 'Alex');

    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter += 2;
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
            CircleContainer(title: model.name),
            CircleContainer(
              title: (model.age ?? 0).toString(),
            ),
            if (model.model != null)
              CircleContainer(title: model.model?.name ?? ''),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
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

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key, required this.title, this.show = true});

  final String title;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: show
          ? Center(
              child: Text(
                title,
              ),
            )
          : null,
    );
  }
}
