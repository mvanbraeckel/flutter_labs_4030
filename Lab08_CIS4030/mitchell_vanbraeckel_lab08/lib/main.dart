import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab08/view/models/attraction_list.dart';
import 'package:provider/provider.dart';
import 'package:mitchell_vanbraeckel_lab08/attractions.dart';
import 'package:mitchell_vanbraeckel_lab08/view/pages/schedule_attraction_page.dart';
import 'package:mitchell_vanbraeckel_lab08/view/pages/add_attraction_page.dart';
import 'package:mitchell_vanbraeckel_lab08/view/widgets/filter_tag.dart';
import 'package:mitchell_vanbraeckel_lab08/view/models/active_filters_map.dart';
import 'package:mitchell_vanbraeckel_lab08/view/models/scheduled_attraction_list.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ActiveFiltersMap()),
        ChangeNotifierProvider(create: (context) => AttractionList()),
        ChangeNotifierProvider(create: (context) => ScheduledAttractionList()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Eight - Mitchell Van Braeckel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab Eight - Mitchell Van Braeckel'),
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

  int _selectedIndex = 0;

  // Functions
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addAttraction() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddAttractionPage())
    );
  }

  void _applyFilters(BuildContext context, Map dialogFiltersCopy, ActiveFiltersMap activeFiltersMap) {
    var _attractionList = Provider.of<AttractionList>(context, listen: false);
    activeFiltersMap.updateActiveFilters(dialogFiltersCopy, _attractionList);

    Navigator.pop(context, 'Apply');
  }

  void _filterDialog(ActiveFiltersMap activeFiltersMap) {
    // Use a deep copy to temporarily show visual changes on filter tag card options on the dialog
    Map dialogFiltersCopy = Map.from(activeFiltersMap.activeFilters);

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).orientation == Orientation.landscape ? (MediaQuery.of(context).size.height)/4.5 : 0.0),
        child: AlertDialog(
          title: const Text('Adjust Filters'),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          content: Wrap(
            children: <Widget>[
              for (var tag in activeFiltersMap.activeFilters.keys) FilterTag(tagText: tag, dialogFiltersCopy: dialogFiltersCopy)
            ],
          ),
          actions: <Widget>[
            Consumer<ActiveFiltersMap>(
              builder: (context, activeFiltersMap, child) {
                return TextButton(
                  // Only update the filter tag states if apply is clicked on the dialog
                  onPressed: () => _applyFilters(context, dialogFiltersCopy, activeFiltersMap),
                  child: const Text('Apply'),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _getScheduledAttractions() {
    var _scheduledAttractionList = Provider.of<ScheduledAttractionList>(context, listen: false);

    if (_scheduledAttractionList.scheduledAttractions.isEmpty) {
      return const Text(
        'No Attractions Scheduled',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 48,
        ),
        textAlign: TextAlign.center,
      );

    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.separated(
          itemCount: _scheduledAttractionList.scheduledAttractions.length,
          itemBuilder: (context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _scheduledAttractionList.scheduledAttractions[index]["title"],
                    // style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _scheduledAttractionList.scheduledAttractions[index]["address"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0)
          ),
        ),
      );
    }
  }

  // Init state
  @override
  void initState() {
    super.initState();

    // init starting attractions from file
    var _attractionList = Provider.of<AttractionList>(context, listen: false);
    // var _attractionList = context.watch<AttractionList>();
    _attractionList.updateGuelphAttractions(guelphAttractions);

    // Adds any new categories and sets the filter tag state to check
    for (var attraction in _attractionList.guelphAttractions) {
      for (var category in attraction["categories"]) {
        if (!activeFilters.containsKey(category)) {
          activeFilters[category] = true;
        }
      }
    }

    // init starting filters from file of starting attractions
    var _activeFiltersMap = Provider.of<ActiveFiltersMap>(context, listen: false);
    // var _activeFiltersMap = context.watch<ActiveFiltersMap>();
    _activeFiltersMap.updateActiveFilters(activeFilters, _attractionList);
  }

  // Widget build
  @override
  Widget build(BuildContext context) {

    var _attractionList = context.watch<AttractionList>();
    var _activeFiltersMap = context.watch<ActiveFiltersMap>();

    Orientation orientation = MediaQuery.of(context).orientation;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (width > height) {
      width = height;
    }

    List<Widget> _widgetOptions = <Widget>[
      /// Attractions List Tab (main home page)
      Consumer<AttractionList>(
        builder: (context, list, child) {
          return ListView.separated(
            itemCount: _attractionList.guelphAttractions.length,
            itemBuilder: (context, int index) {
              bool _allActive = true;
              for(var category in _attractionList.guelphAttractions[index]["categories"]) {
                if(!_activeFiltersMap.activeFilters[category]) {
                  _allActive = false;
                  break;
                }
              }

              if (_allActive) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                  child: Container(
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: orientation == Orientation.landscape ? width/3 : 0.0),
                      elevation: 20.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _attractionList.guelphAttractions[index]["title"],
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
                                  tag: '${_attractionList.guelphAttractions[index]["title"]}',
                                  child: Image.network(
                                    _attractionList.guelphAttractions[index]["imageURL"],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                for (var category in _attractionList.guelphAttractions[index]["categories"]) Card(
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(category)
                                  ),
                                ),
                              ],
                            ),
                            Text(_attractionList.guelphAttractions[index]["address"]),
                            Icon(
                              _attractionList.guelphAttractions[index]["isFree"] ? Icons.money_off : Icons.attach_money,
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
                padding: EdgeInsets.all(0.0)
            ),
          );
        },
      ),
      /// Scheduled Attractions Tab
      Consumer<ScheduledAttractionList>(
        builder: (context, list, child) {
          return _getScheduledAttractions();
        },
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
            onPressed: () => _filterDialog(_activeFiltersMap),
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
        tooltip: 'Add Attraction',
        child: const Icon(Icons.add),
      ),
    );
  }
}
