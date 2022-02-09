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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: CalcBody(),
        ),
      ),
    );
  }
}

class CalcBody extends StatefulWidget {
  const CalcBody({Key? key}) : super(key: key);

  @override
  State<CalcBody> createState() => _CalcBodyState();
}

class _CalcBodyState extends State<CalcBody> {

  // Attributes
  String _screenText = "0";
  String num1 = "0";
  String operator = "";
  String num2 = "0";
  bool firstDigit = true;
  bool operationsDisabled = false;

  void _selectButton(String btnText) {
    if(btnText == "Clear") {
      _screenText = "0";
      num1 = "0";
      operator = "";
      num2 = "0";
      firstDigit = true;
      operationsDisabled = false;
    } else if(btnText == "/" || btnText == "*" || btnText == "-" || btnText == "+") {
      _screenText += btnText;
      operator = btnText;
      operationsDisabled = true;
    } else if(btnText == "=") {
      if(operator == "/") {
        _screenText = "${double.parse(num1) / double.parse(num2)}";
      } else if(operator == "*") {
        _screenText = "${double.parse(num1) * double.parse(num2)}";
      } else if(operator == "-") {
        _screenText = "${double.parse(num1) - double.parse(num2)}";
      } else if(operator == "+") {
        _screenText = "${double.parse(num1) + double.parse(num2)}";
      }
      debugPrint("ans=$_screenText");

      num1 = _screenText;
      operator = "";
      num2 = "0";
      operationsDisabled = false;
    } else {
      if(firstDigit && operator == "") {
        _screenText = btnText;
        firstDigit = false;
      } else {
        _screenText += btnText;
      }

      if(!operationsDisabled) {
        num1 += btnText;
        debugPrint("num1=$num1");
      } else {
        num2 += btnText;
        debugPrint("num2=$num2");
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        _buildRow([_buildCalculatorButton(3, "Clear"), _buildCalculatorButton(1, "/", opBtn: true)]),
        _buildRow([_buildCalculatorButton(1, "7"), _buildCalculatorButton(1, "8"), _buildCalculatorButton(1, "9"), _buildCalculatorButton(1, "*", opBtn: true)]),
        _buildRow([_buildCalculatorButton(1, "4"), _buildCalculatorButton(1, "5"), _buildCalculatorButton(1, "6"), _buildCalculatorButton(1, "-", opBtn: true)]),
        _buildRow([_buildCalculatorButton(1, "1"), _buildCalculatorButton(1, "2"), _buildCalculatorButton(1, "3"), _buildCalculatorButton(1, "+", opBtn: true)]),
        _buildRow([_buildCalculatorButton(1, "0"), _buildCalculatorButton(3, "=")]),
      ],
    );
  }

  Expanded _buildRow(List<Flexible> btnList) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var i in btnList) i
        ],
      ),
    );
  }

  Flexible _buildCalculatorButton(int flex, String btnText, {bool opBtn = false}) => Flexible(
    flex: flex,
    fit: FlexFit.tight,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: opBtn && operationsDisabled ? null : () {
            _selectButton(btnText);
          },
          child: Text(
            btnText,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    )
  );
}
