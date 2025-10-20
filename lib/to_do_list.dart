import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

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
      debugShowCheckedModeBanner: false,
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
  DateTime _focusedDay = DateTime.now(); //Месяц
  DateTime _selectedDay = DateTime.now(); //Дата

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.toc)),
              Tab(icon: Icon(Icons.done_all)),
              Tab(icon: Icon(Icons.event)),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('To-Do List'),
        ),
        body: TabBarView(
          children: [
            //Вкладки
            firstTab(),
            secondTab(),
            TableCalendar(
              firstDay: DateTime.utc(2000, 01, 01),
              lastDay: DateTime.utc(2030, 01, 01),
              focusedDay: _focusedDay, //Какая дата сейчас отображается
              //Проверка совпадает ли дата с выбранной
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              //Выбор даты
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              //Переключение месяцев
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
            ),
          ],
        ),

        floatingActionButton: addButton(context),
      ),
    );
  }
}

//Вкладка 1
Widget secondTab() {
  return StreamBuilder<List<Map<String, dynamic>>>(
    stream: _tasksStream,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }
      final tasks = snapshot.data!;
      final filteredTasks = tasks
          .where((task) => task['is_done'] == true)
          .toList();
      return ListView.separated(
        itemCount: filteredTasks.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: Icon(Icons.bookmark),
          title: Text(
            filteredTasks[i]['name'],
            style: (TextStyle(decoration: TextDecoration.lineThrough)),
          ),
        ),
      );
    },
  );
}

//Вкладка 2
Widget firstTab() {
  return StreamBuilder<List<Map<String, dynamic>>>(
    stream: _tasksStream,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }
      final tasks = snapshot.data!; //не null
      final filteredTasks = tasks
          .where((task) => task['is_done'] == false)
          .toList();
      print(tasks);
      return ListView.separated(
        itemCount: filteredTasks.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: Icon(Icons.bookmark),
          trailing: Checkbox(
            value: filteredTasks[i]['is_done'],
            onChanged: (value) async {
              await Supabase.instance.client
                  .from('tasks')
                  .update({'is_done': value})
                  .eq('id', filteredTasks[i]['id']);
            },
          ),
          title: Text(
            filteredTasks[i]['name'],
            style: (filteredTasks[i]['is_done'] ?? false)
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
        ),
      );
    },
  );
}

//Кнопка добавления записи
Widget addButton(context) {
  return FloatingActionButton(
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
  );
}
