import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/recipes.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/recipe_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/recipes_app_home_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/favourite_recipes_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/settings_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/widgets/recipe_grid_tile.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/widgets/recipes_app_drawer.dart';

class RecipesAppHomePage extends StatefulWidget {
  const RecipesAppHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RecipesAppHomePage> createState() => _RecipesAppHomePageState();
}

class _RecipesAppHomePageState extends State<RecipesAppHomePage> {

  // Functions
  void _openRecipePage(BuildContext context, int index) async {
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipePage(index: index))
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: RecipesAppDrawer(title: widget.title),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: temp_recipe_list.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () => _openRecipePage(context, index),
              child: RecipeGridTile(index: index)
            );
          }
        ),
      ),
    );
  }
}