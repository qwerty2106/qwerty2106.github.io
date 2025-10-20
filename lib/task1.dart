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
      debugShowCheckedModeBanner: false,
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
            //Прямоугольник
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  border: Border.all(color: Colors.pinkAccent, width: 3),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(5, 5))],
                ),
                width: 150,
                height: 50,
                // color: Colors.deepPurple,
                // decoration: Shadow(),
              ),
            ),
            //Строка с текстом
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Text1',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Text1', style: TextStyle(color: Colors.indigoAccent)),
                  Text(
                    'Text3',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
            //Прямоугольник
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: 350,
                height: 50,
                color: Colors.deepPurpleAccent,
              ),
            ),

            //Скролл с картинками
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 15; i++)
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 100,
                      child: Image(
                        image: NetworkImage(
                          'https://avatars.mds.yandex.net/i?id=7689b105b90034863b2e7f312e470b10_l-10639796-images-thumbs&n=13',
                        ),
                      ),
                    ),
                ],
              ),
            ),

            //Круги
            Expanded(
              child: Row(
                children: [
                  //Первый круг
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/2e/d6/28/2ed628e4ebfbf9331e42ddef93cc0600.jpg',
                      ),
                    ),
                  ),
                  //Второй круг
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/1e/fb/6c/1efb6c6907e06f2ffddcd07d1fea1a23.jpg',
                      ),
                    ),
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
