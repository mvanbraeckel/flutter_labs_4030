import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_five_a/attractions.dart';
import 'package:mitchell_vanbraeckel_lab_five_a/view/pages/schedule_attraction_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_a/view/pages/add_attraction_page.dart';
import 'package:mitchell_vanbraeckel_lab_five_a/view/widgets/photo_hero.dart';
import 'package:mitchell_vanbraeckel_lab_five_a/view/widgets/filter_tag.dart';

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
      title: 'Lab Five Part A - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Five Part A - Mitchell Van Braeckel'),
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
  // static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: guelphAttractions.length,
      itemBuilder: (context, int index) {
        return Card(
          elevation: 20.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  guelphAttractions[index]["title"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ScheduleAttractionPage(index: index)
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Hero(
                      tag: '${guelphAttractions[index]["title"]}',
                      child: Image.network(
                        guelphAttractions[index]["imageURL"],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                // PhotoHero(
                //   photo: guelphAttractions[index]["imageURL"],
                //   width: double.infinity,
                //   boxFit: BoxFit.contain,
                //   onTap: () => Navigator.of(context).push(
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) => ScheduleAttractionPage(index: index)
                //     ),
                //   ),
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var category in guelphAttractions[index]["categories"]) Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(category)
                      ),
                    ),
                  ],
                ),
                Text(guelphAttractions[index]["address"]),
                Icon(
                  guelphAttractions[index]["isFree"] ? Icons.money_off : Icons.attach_money,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Padding(padding: EdgeInsets.all(16.0)),
    ),
    const Text(
      'Schedule Page',
      // style: optionStyle,
    ),
  ];

  final List<String> _filterTags = <String>[
    for (var attraction in guelphAttractions) for (var category in attraction["categories"]) category
  ];

  // for (var attraction in attractions) {
  //   for (var category in attraction["categories"]) {
  //     _filterTags.add(category);
  //   }
  // }

  int _selectedIndex = 0;

  // Functions
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addAttraction() {
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const AddAttractionPage()
        ),
      );
    });
  }

  void _filterDialog() {
    // String _toPrint = "";
    // for (var tag in _filterTags) {
    //   _toPrint += ", $tag";
    // }
    // debugPrint(_toPrint);

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Adjust Filters'),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            // spacing: 8.0,
            // runSpacing: 4.0,
            children: <Widget>[
              for (var tag in _filterTags) FilterTag(tagText: tag)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Apply'),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  // Widget build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            tooltip: 'Filter attractions',
            onPressed: () => _filterDialog(),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Attractions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Scheduled',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAttraction,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
