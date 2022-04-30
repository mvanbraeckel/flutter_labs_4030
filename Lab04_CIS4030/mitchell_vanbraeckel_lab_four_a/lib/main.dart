import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_four_a/attractions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Four Part A - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Four Part A - Mitchell Van Braeckel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: attractions.length,
          itemBuilder: (context, int index) {
            return Card(
              elevation: 20.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      attractions[index]["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.network(attractions[index]["imageURL"]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (var category in attractions[index]["categories"]) Card(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(category)
                          ),
                        ),
                      ],
                    ),
                    Text(attractions[index]["address"]),
                    Icon(
                      attractions[index]["isFree"] ? Icons.money_off : Icons.attach_money,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Padding(padding: EdgeInsets.all(16.0)),
        ),
      ),
    );
  }
}
