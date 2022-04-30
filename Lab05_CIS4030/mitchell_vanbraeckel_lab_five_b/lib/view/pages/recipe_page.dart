import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/recipes.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  // Attributes
  final double _recipeImageHeight = 200.0;
  // final double _headingFontSize = 32.0;
  // final double _contentFontSize = 20.0;

  // Functions
  _onFavouriteSelected() {
    setState(() {
      temp_recipe_list[widget.index]["isFavourite"] = !temp_recipe_list[widget.index]["isFavourite"];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(temp_recipe_list[widget.index]["recipeName"]),
        actions: [
          IconButton(
            // padding: const EdgeInsets.all(0.0),
            icon: temp_recipe_list[widget.index]["isFavourite"] ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
            color: Colors.red,
            tooltip: 'Favourite recipe',
            onPressed: () => _onFavouriteSelected(),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          // Recipe Content
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              // Placeholder for top-locked recipe image
              Container(
                height: _recipeImageHeight,
                // alignment: Alignment.topCenter,
              ),

              // Author
              _buildBlock(rows: <Row>[
                Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("Author:", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Flexible(
                      child: Text(
                        temp_recipe_list[widget.index]["recipeAuthor"],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ]),

              // Description
              _buildBlock(rows: <Row>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("Description:", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        temp_recipe_list[widget.index]["description"],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              ]),

              // Ingredients
              _buildBlock(rows: <Row>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("Ingredients:", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Wrap(
                          spacing: 12.0,
                          children: <Widget>[
                            for (var ingredient in temp_recipe_list[widget.index]["ingredients"])
                              Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${temp_recipe_list[widget.index]["ingredients"].indexOf(ingredient)+1}. $ingredient",
                                    style: const TextStyle(fontSize: 20),
                                  )
                              )
                          ],
                        ),
                        // child: Text(
                        //   _buildIngredientsListString(ingredientsList: temp_recipe_list[widget.index]["ingredients"]),
                        //   style: const TextStyle(fontSize: 16),
                        // ),
                      ),
                    ),
                  ],
                )
              ]),

              // Time to Cook
              _buildBlock(rows: <Row>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("Time to Cook:", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        "${temp_recipe_list[widget.index]["cookTime"]} mins",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              ]),

              // Directions
              _buildBlock(rows: <Row>[
                Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("Directions:", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
                for (var i in temp_recipe_list[widget.index]["directions"]) Row(
                  children: <Widget>[
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${temp_recipe_list[widget.index]["directions"].indexOf(i)+1}. $i",
                            style: const TextStyle(fontSize: 20),
                          ),
                        )
                    ),
                  ],
                ),
              ]),

            ],
          ),

          // Top-Locked Recipe Image
          Container(
            height: _recipeImageHeight,
            alignment: Alignment.topCenter,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(temp_recipe_list[widget.index]["imageUrl"]),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildBlock({required List<Row> rows}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: <Widget>[
          for (var row in rows) Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: row
          )
        ],
      ),
    );
  }

  // _buildIngredientsListString({required List<String> ingredientsList}) {
  //   List<String> list = List<String>.from(ingredientsList);
  //   int _counter = 0;
  //   for(var ingredient in list) {
  //     list[_counter] = "${++_counter}. $ingredient";
  //   }
  //   return list.join("  ");
  // }
}