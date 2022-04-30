import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_four_b/recipes.dart';

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
      title: 'Lab Four Part B - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Four Part B - Mitchell Van Braeckel'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: temp_recipe_list.length,
          itemBuilder: (context, int index) {
            return Stack(
              children: <Widget>[

                // -- Background Image --
                Container(
                  margin: const EdgeInsets.all(8.0),
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(temp_recipe_list[index]["imageUrl"]),
                      fit: BoxFit.fill
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),

                // -- Black Opacity -- (and top part)
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.50),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              temp_recipe_list[index]["recipeAuthor"],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                Text(
                                  '${temp_recipe_list[index]["totalLikes"]}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // (remaining bottom part)
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
                              temp_recipe_list[index]["recipeName"],
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
                                  temp_recipe_list[index]["cookingTime"].toString().split('.').last,
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
                                  temp_recipe_list[index]["amountOfIngredients"].toString().split('.').last,
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
                                  temp_recipe_list[index]["recipeDifficulty"].toString().split('.').last,
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

              ]
            );
          }
        ),
      ),
    );
  }
}
