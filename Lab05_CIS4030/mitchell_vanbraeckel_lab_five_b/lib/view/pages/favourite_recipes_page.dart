import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/widgets/recipes_app_drawer.dart';

class FavouriteRecipesPage extends StatefulWidget {
  const FavouriteRecipesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FavouriteRecipesPage> createState() => _FavouriteRecipesPageState();
}

class _FavouriteRecipesPageState extends State<FavouriteRecipesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: RecipesAppDrawer(title: widget.title),
      body: const Center(
        child: Text("Favourite Recipes")
      ),
    );
  }
}