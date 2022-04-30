import 'package:flutter/material.dart';
// import 'package:collection/collection.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/attractions.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/view/pages/schedule_attraction_page.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/view/pages/add_attraction_page.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/view/widgets/photo_hero.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/view/widgets/filter_tag.dart';

// Map activeFilters = {};
// Map dialogFiltersCopy = {};

void main() {
  // for (var attraction in guelphAttractions) {
  //   for (var category in attraction["categories"]) {
  //     if (!activeFilters.containsKey(category)) {
  //       activeFilters[category] = true;
  //     }
  //   }
  // }
  // // dialogFiltersCopy = Map.from(activeFilters);

  runApp(const MyApp());

  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context) => const AddAttractionPage()),
  //       Provider(create: (context) => SomeOtherClass()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Seven Part A - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Seven Part A - Mitchell Van Braeckel'),
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

  // final List<String> _filterTags = <String>[
  //   for (var attraction in guelphAttractions) for (var category in attraction["categories"]) category
  // ];

  // List<String> _activeFilters = <String>[
  //   for (var attraction in guelphAttractions) for (var category in attraction["categories"]) category
  // ];

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

  void _addAttraction() async {
    // setState(() {
    //   Navigator.of(context).push(
    //     MaterialPageRoute<void>(
    //       builder: (BuildContext context) => const AddAttractionPage()
    //     ),
    //   );
    // });

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddAttractionPage())
    );
    setState(() {});
    // debugPrint(guelphAttractions.last.toString());
  }

  // void _applyFilters(BuildContext context) async {
  void _applyFilters(BuildContext context, Map dialogFiltersCopy) async {
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Lab Six Part A - Mitchell Van Braeckel'))
    // );

    Navigator.pop(context, 'Apply');

    setState(() {
      activeFilters = Map.from(dialogFiltersCopy);
    });
  }

  void _filterDialog() {
    // void _filterDialog(double width) {
    // String _toPrint = "";
    // for (var tag in _filterTags) {
    //   _toPrint += ", $tag";
    // }
    // debugPrint(_toPrint);

    // Use a deep copy to temporarily show visual changes on filter tag card options on the dialog
    Map dialogFiltersCopy = Map.from(activeFilters);

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Container(
        // width: width,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? (MediaQuery.of(context).size.height)/4.5 : 0.0),
        // margin: const EdgeInsets.symmetric(),
        child: AlertDialog(
          title: const Text('Adjust Filters'),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          content: Wrap(
            children: <Widget>[
              for (var tag in activeFilters.keys) FilterTag(tagText: tag, dialogFiltersCopy: dialogFiltersCopy)
            ],
          ),
          actions: <Widget>[
            TextButton(
              // Only update the filter tag states if apply is clicked on the dialog
              onPressed: () => _applyFilters(context, dialogFiltersCopy),
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  // Init state
  @override
  void initState() {
    super.initState();

    // Adds any new categories and sets the filter tag state to check
    for (var attraction in guelphAttractions) {
      for (var category in attraction["categories"]) {
        if (!activeFilters.containsKey(category)) {
          activeFilters[category] = true;
        }
      }
    }
    // dialogFiltersCopy = Map.from(activeFilters);
  }

  // Widget build
  @override
  Widget build(BuildContext context) {

    Orientation orientation = MediaQuery.of(context).orientation;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // todo -mvb- alternative: comment out this 'if' and change landscape margin to width/4
    // do a query directly on the card/list, use the smaller of the two
    if (width > height) {
      width = height;
    }

    // Orientation orientation = MediaQuery.of(context).orientation;
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // // todo -mvb- alternative: comment out this 'if' and change landscape margin to width/4
    // // do a query directly on the card/list, use the smaller of the two
    // if (width < height) {
    //   height = width;
    // } else {
    //   width = height;
    // }

    List<Widget> _widgetOptions = <Widget>[
      ListView.separated(
        // padding: const EdgeInsets.all(16.0),
        itemCount: guelphAttractions.length,
        itemBuilder: (context, int index) {
          // debugPrint(index.toString());
          // debugPrint(guelphAttractions[index].toString());
          bool _allActive = true;
          for(var category in guelphAttractions[index]["categories"]) {
            if(!activeFilters[category]) {
              _allActive = false;
              break;
            }
          }

          // guelphAttractions[index]["categories"] are in _activeFilters list
          if (_allActive) {
            return Padding(
              // padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              // todo add container / sized box here
              child: Container(
                // padding: const EdgeInsets.all(16.0),
                // width: width,
                // height: height,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: orientation == Orientation.landscape ? width/3 : 0.0),
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
                ),
              ),
            );
          } else {
            return const SizedBox(height: 0.0);
          }

        },
        separatorBuilder: (BuildContext context, int index) => const Padding(
          // padding: EdgeInsets.all(16.0)
            padding: EdgeInsets.all(0.0)
        ),
      ),
      const Text(
        'Schedule Page',
        // style: optionStyle,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            tooltip: 'Filter attractions',
            onPressed: () => _filterDialog(),
            // onPressed: () => _filterDialog(orientation == Orientation.landscape ? width/4 : 0.0),
            // onPressed: () => _filterDialog(width),
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
