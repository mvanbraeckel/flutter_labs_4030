import 'package:flutter/material.dart';

class AddAttractionPage extends StatefulWidget {
  const AddAttractionPage({Key? key}) : super(key: key);

  @override
  State<AddAttractionPage> createState() => _AddAttractionPageState();
}

class _AddAttractionPageState extends State<AddAttractionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Attraction"),
      ),
      body: const Center(
        child: Text("Add Attraction")
      ),
    );
  }
}