import 'package:flutter/material.dart';

//Запуск приложения
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.indigo,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 50, width: 50, color: Colors.blueGrey),
                      Container(height: 50, width: 100, color: Colors.blueGrey),
                    ],
                  ),

                  Text('Total balance to spend'),
                  Text(
                    '5786.55',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(5),
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Planning Ahead',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('-540.52'),
                    ],
                  ),
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 100,
                          color: Colors.blueGrey,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 100,
                          color: Colors.blueGrey,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 100,
                          color: Colors.blueGrey,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 100,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),             
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(5),
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Last Month Expense'), Text('1800.50')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(children: [Text('25')]),
                          Row(children: [Text('MAR')]),
                        ],
                      ),
                      Column(
                        children: [
                          Row(children: [Text('26')]),
                          Row(children: [Text('MAR')]),
                        ],
                      ),
                      Column(
                        children: [
                          Row(children: [Text('27')]),
                          Row(children: [Text('MAR')]),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
