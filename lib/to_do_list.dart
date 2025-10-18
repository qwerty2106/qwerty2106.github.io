import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String test = 'test';

//Запуск приложения
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dllhkfwyiexblndowpxh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsbGhrZnd5aWV4YmxuZG93cHhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAxMDc4OTEsImV4cCI6MjA3NTY4Mzg5MX0.gd0UW_yiHnH2TotoAv8s6-Jvfg-jPq4ybMKVz18bsaM',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//GET запрос
final _tasksStream = Supabase.instance.client
    .from('tasks')
    .stream(primaryKey: ['id']);

class _MyHomePageState extends State<MyHomePage> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('To-Do List'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _tasksStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final tasks = snapshot.data!; //не null
          print(tasks);
          return ListView.separated(
            itemCount: tasks.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, i) => ListTile(
              leading: Icon(Icons.bookmark),
              trailing: Checkbox(
                value: tasks[i]['is_done'],
                onChanged: (value) async {
                  await Supabase.instance.client
                      .from('tasks')
                      .update({'is_done': value})
                      .eq('id', tasks[i]['id']);
                  //   setState(() {
                  //      isChecked = value!;
                  //    });
                },
              ),
              title: Text(
                tasks[i]['name'] +
                    ',' +
                    i.toString() +
                    ',' +
                    tasks[i]['id'].toString(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) async {
                      await Supabase.instance.client.from('tasks').insert({
                        'name': value,
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
