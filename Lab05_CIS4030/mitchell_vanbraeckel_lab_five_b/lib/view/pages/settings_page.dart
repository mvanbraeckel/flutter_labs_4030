import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/widgets/recipes_app_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: RecipesAppDrawer(title: widget.title),
      body: const Center(
          child: Text("Settings")
      ),
    );
  }
}