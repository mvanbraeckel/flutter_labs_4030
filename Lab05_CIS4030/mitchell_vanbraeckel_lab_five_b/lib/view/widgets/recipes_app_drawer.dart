import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/favourite_recipes_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/recipes_app_home_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_b/view/pages/settings_page.dart';

class RecipesAppDrawer extends StatefulWidget {
  const RecipesAppDrawer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RecipesAppDrawer> createState() => _RecipesAppDrawerState();
}

class _RecipesAppDrawerState extends State<RecipesAppDrawer> {

  // Functions
  void _openRecipesAppHomePage(BuildContext context, String title) async {
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipesAppHomePage(title: widget.title))
    );

    setState(() {});
  }
  void _openFavouriteRecipesPage(BuildContext context, String title) async {
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavouriteRecipesPage(title: widget.title))
    );

    setState(() {});
  }
  void _openSettingsPage(BuildContext context, String title) async {
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage(title: widget.title))
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Recipe App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Recipes'),
            onTap: () => _openRecipesAppHomePage(context, widget.title),
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: const Text('Favourite Recipes'),
            onTap: () => _openFavouriteRecipesPage(context, widget.title),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => _openSettingsPage(context, widget.title),
          ),
        ],
      )
    );
  }
}