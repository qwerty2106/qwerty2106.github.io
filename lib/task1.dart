import 'package:flutter/material.dart';

// Запуск приложения
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // print('Button pressed!');
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(children: [Text('Button pressed!')]);
            },
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.deepOrange),
                  CircleAvatar(radius: 50, backgroundColor: Colors.deepPurple),
                  Container(width: 100, height: 100, color: Colors.blueGrey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
