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
      title: 'Lab Three Part B - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Three Part B - Mitchell Van Braeckel'),
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

  // Attributes
  String _screenText = "hehe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(4.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _screenText,
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildRow([const Button(flex: 3, btnText: "Clear"), const Button(flex: 1, btnText: "/")]),
              _buildRow([const Button(flex: 1, btnText: "7"), const Button(flex: 1, btnText: "8"), const Button(flex: 1, btnText: "9"), const Button(flex: 1, btnText: "*")]),
              _buildRow([const Button(flex: 1, btnText: "4"), const Button(flex: 1, btnText: "5"), const Button(flex: 1, btnText: "6"), const Button(flex: 1, btnText: "-")]),
              _buildRow([const Button(flex: 1, btnText: "1"), const Button(flex: 1, btnText: "2"), const Button(flex: 1, btnText: "3"), const Button(flex: 1, btnText: "+")]),
              _buildRow([const Button(flex: 1, btnText: "0"), const Button(flex: 3, btnText: "=")]),
            ],
          ),
        ),
      ),

    );
  }

  Expanded _buildRow(List<Button> btnList) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var i in btnList) i
        ],
      ),
    );
  }
}

class Button extends StatefulWidget {
  final String btnText;
  final int flex;
  const Button({Key? key, required this.flex, required this.btnText}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  // Attributes

  // void _selectBox() {
  //
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: widget.flex,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              widget.btnText,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
