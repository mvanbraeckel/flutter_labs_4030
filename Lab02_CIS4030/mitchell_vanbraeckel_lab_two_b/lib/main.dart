import 'package:flutter/material.dart';

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
      title: 'Lab Two Part B - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Two Part B - Mitchell Van Braeckel'),
    );
  }
}

class ColouredBox extends StatefulWidget {
  final Color? colour;
  const ColouredBox({Key? key, required this.colour}) : super(key: key);

  @override
  State<ColouredBox> createState() => _ColouredBox();
}

class _ColouredBox extends State<ColouredBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded( // Flex here? -mvb
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Container(
          alignment: Alignment.center,
          //margin: const EdgeInsets.all(0.0), // margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
          decoration: BoxDecoration(
            color: widget.colour,
          ),
        ),
      )
      // child: Container(
      //   alignment: Alignment.center,
      //   margin: const EdgeInsets.all(8.0), // margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
      //   decoration: BoxDecoration(
      //     color: widget.colour,
      //   ),
      // ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  ColouredBox(colour: Colors.red),
                  ColouredBox(colour: Colors.red),
                  ColouredBox(colour: Colors.red),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  ColouredBox(colour: Colors.blue),
                  ColouredBox(colour: Colors.blue),
                  ColouredBox(colour: Colors.blue),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  ColouredBox(colour: Colors.yellow),
                  ColouredBox(colour: Colors.yellow),
                  ColouredBox(colour: Colors.yellow),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  ColouredBox(colour: Colors.green),
                  ColouredBox(colour: Colors.green),
                  ColouredBox(colour: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
