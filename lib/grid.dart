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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigoAccent,
                  height: 25,
                  width: 100,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigoAccent,
                  height: 25,
                  width: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.indigo,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            // Container(color: Colors.amber, width: 30, height: 30),
            // Text('title'),
          ],
        ),
      ),
    );
  }
}
