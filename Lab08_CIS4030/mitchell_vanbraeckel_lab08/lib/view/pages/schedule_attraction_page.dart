import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab08/view/models/scheduled_attraction_list.dart';
import 'package:provider/provider.dart';

import '../models/attraction_list.dart';

class ScheduleAttractionPage extends StatefulWidget {
  const ScheduleAttractionPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ScheduleAttractionPage> createState() => _ScheduleAttractionPageState();
}

class _ScheduleAttractionPageState extends State<ScheduleAttractionPage> {

  // Functions
  void _addScheduledAttraction(AttractionList attractionList, ScheduledAttractionList scheduledAttractionList) {
    Map attractionToSchedule = {
      "title": attractionList.guelphAttractions[widget.index]["title"],
      "address": attractionList.guelphAttractions[widget.index]["address"],
    };
    scheduledAttractionList.add(attractionToSchedule);
  }

  @override
  Widget build(BuildContext context) {

    var _attractionList = Provider.of<AttractionList>(context, listen: false);
    var _scheduledAttractionList = context.watch<ScheduledAttractionList>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Schedule Attraction"),
      ),
      body: Stack(
        children: <Widget>[
          // -- Background Image --
          SizedBox.expand(
            child: Hero(
              tag: '${_attractionList.guelphAttractions[widget.index]["title"]}',
              child: Image.network(
                _attractionList.guelphAttractions[widget.index]["imageURL"],
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.75),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),

          // -- Attraction Content --
          ListView(
            children: <Widget>[
              _buildBlock(vPad: 0.0, rows: <Row>[
                _buildRow(items: <Widget>[
                  Flexible(
                    child: Text(
                      _attractionList.guelphAttractions[widget.index]["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              ]),

              // Categories
              _buildBlock(rows: <Row>[
                _buildRow(items: <Widget>[
                  const Flexible(
                    child: Text(
                      "Categories",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                _buildRow(items: <Widget>[
                  for (var category in _attractionList.guelphAttractions[widget.index]["categories"]) Card(
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(category)
                    ),
                  ),
                ]),
              ]),

              // Description
              _buildBlock(rows: <Row>[
                _buildRow(items: <Widget>[
                  const Flexible(
                    child: Text(
                      "Description",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                _buildRow(items: <Widget>[
                  Flexible(
                    child: Text(
                      _attractionList.guelphAttractions[widget.index]["description"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ]),

              // Address
              _buildBlock(rows: <Row>[
                _buildRow(items: <Widget>[
                  const Flexible(
                    child: Text(
                      "Address",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                _buildRow(items: <Widget>[
                  Flexible(
                    child: Text(
                      _attractionList.guelphAttractions[widget.index]["address"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ]),

              // Cost
              _buildBlock(rows: <Row>[
                _buildRow(items: <Widget>[
                  const Flexible(
                    child: Text(
                      "Cost",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                _buildRow(items: <Widget>[
                  Flexible(
                    child: Text(
                      _attractionList.guelphAttractions[widget.index]["isFree"] ? "Free" : "Not Free",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ]),

              _buildBlock(rows: <Row>[
                _buildRow(items: <Widget>[
                  ElevatedButton(
                    onPressed: () => _addScheduledAttraction(_attractionList, _scheduledAttractionList),
                    // onPressed: () => _filterDialog(_activeFiltersMap),
                    child: const Text("Add")
                  )
                ]),
              ]),

            ],
          ),
        ],
      ),
    );
  }

  _buildBlock({double hPad=2.0, double vPad=12.0, required List<Row> rows}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (var row in rows) Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: row
          )
        ],
      ),
    );
  }

  _buildRow({required List<Widget> items}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var item in items) item
      ],
    );
  }
}