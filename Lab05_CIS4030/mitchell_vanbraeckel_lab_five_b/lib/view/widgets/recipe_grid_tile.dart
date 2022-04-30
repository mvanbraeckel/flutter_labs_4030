import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/recipes.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/recipe_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/recipes_app_home_page.dart';

class RecipeGridTile extends StatefulWidget {
  const RecipeGridTile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<RecipeGridTile> createState() => _RecipeGridTileState();
}

class _RecipeGridTileState extends State<RecipeGridTile> {

  // Functions
  _onFavouriteSelected() {
    setState(() {
      temp_recipe_list[widget.index]["isFavourite"] = !temp_recipe_list[widget.index]["isFavourite"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        // -- Background Image --
        Container(
          margin: const EdgeInsets.all(8.0),
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(temp_recipe_list[widget.index]["imageUrl"]),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.50), BlendMode.darken),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
        ),

        // Bottom part
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      temp_recipe_list[widget.index]["recipeName"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text(
                          temp_recipe_list[widget.index]["cookingTime"].toString().split('.').last,
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text(
                          temp_recipe_list[widget.index]["amountOfIngredients"].toString().split('.').last,
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.help_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text(
                          temp_recipe_list[widget.index]["recipeDifficulty"].toString().split('.').last,
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Top part
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      temp_recipe_list[widget.index]["recipeAuthor"],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        // IconButton(
                        //   padding: const EdgeInsets.all(0.0),
                        //   icon: Icon(
                        //     temp_recipe_list[widget.index]["isFavourite"] ? Icons.favorite : Icons.favorite_border,
                        //     color: Colors.red,
                        //   ),
                        //   tooltip: 'Favourite this recipe',
                        //   onPressed: _onFavouriteSelected,
                        // ),
                        GestureDetector(
                          onTap: () => _onFavouriteSelected(),
                          child: Icon(
                            temp_recipe_list[widget.index]["isFavourite"] ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                        // Removed because we don't like how it looks
                        // Text(
                        //   '${temp_recipe_list[widget.index]["totalLikes"]}',
                        //   style: const TextStyle(
                        //     fontSize: 10,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

      ]
    );
  }
}