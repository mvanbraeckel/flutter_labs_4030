import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/recipes_app_home_page.dart';

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
      title: 'Lab Five Part B - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipesAppHomePage(title: 'Lab Five Part B - Mitchell Van Braeckel'),
    );
  }
}
