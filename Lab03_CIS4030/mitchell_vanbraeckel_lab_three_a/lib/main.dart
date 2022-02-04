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
      title: 'Lab Three Part A - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Three Part A - Mitchell Van Braeckel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
            _buildRow(const ColouredBox(colour: Colors.red)),
            _buildRow(const ColouredBox(colour: Colors.blue)),
            _buildRow(const ColouredBox(colour: Colors.yellow)),
            _buildRow(const ColouredBox(colour: Colors.green)),
          ],
        ),
      ),
    );
  }

  Expanded _buildRow(ColouredBox colouredBox) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          colouredBox,
          colouredBox,
          colouredBox,
        ],
      ),
    );
  }
}

class ColouredBox extends StatefulWidget {
  final Color colour;
  const ColouredBox({Key? key, required this.colour}) : super(key: key);

  @override
  State<ColouredBox> createState() => _ColouredBoxState();
}

class _ColouredBoxState extends State<ColouredBox> {

  // Attributes
  bool _isBoxSelected = false;

  // void _selectBox(int id) {
  //
  //   setState(() {
  //     _isBoxSelected = !_isBoxSelected;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                // Toggle when tapped.
                _isBoxSelected = !_isBoxSelected;
              });
            },
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.colour,
                  ),
                ),
                AnimatedContainer(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _isBoxSelected ? Colors.black.withOpacity(0.50) : Colors.transparent,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.check_circle,
                        color: _isBoxSelected ? Colors.white : Colors.transparent,
                        // size: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
