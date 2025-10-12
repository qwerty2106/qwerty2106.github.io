import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://hogfvggthtmezcdatnhn.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvZ2Z2Z2d0aHRtZXpjZGF0bmhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAxMTczMDIsImV4cCI6MjA3NTY5MzMwMn0.MrEc_6Yp0rdOXiwFLyQjfN-eTulhQlwSxathZBw0Ato';

// Future<void> main() async {
//   await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
//   runApp(MyApp());
// }

//Запуск приложения
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dllhkfwyiexblndowpxh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsbGhrZnd5aWV4YmxuZG93cHhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAxMDc4OTEsImV4cCI6MjA3NTY4Mzg5MX0.gd0UW_yiHnH2TotoAv8s6-Jvfg-jPq4ybMKVz18bsaM',
  );
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
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(color: Colors.indigo, child: header()),
                body(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget header() {
  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(height: 50, width: 50, color: Colors.white),
            Container(height: 50, width: 100, color: Colors.white),
          ],
        ),

        Text('Total balance to spend'),
        Text(
          '5786.55',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget body() {
  return Container(
    margin: EdgeInsets.all(5),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Planning Ahead',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text('-540.52'),
          ],
        ),
        scrollContainer(),
      ],
    ),
  );
}

Widget scrollContainer() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (int i = 0; i < 15; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: 50,
            width: 100,
            color: Colors.indigo,
          ),
      ],
    ),
  );
}

Widget footer() {
  return Container(
    margin: EdgeInsets.all(5),
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
  );
}
