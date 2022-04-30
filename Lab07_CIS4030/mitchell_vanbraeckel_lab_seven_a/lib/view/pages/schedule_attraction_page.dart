import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/attractions.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/view/widgets/photo_hero.dart';

class ScheduleAttractionPage extends StatefulWidget {
  const ScheduleAttractionPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ScheduleAttractionPage> createState() => _ScheduleAttractionPageState();
}

class _ScheduleAttractionPageState extends State<ScheduleAttractionPage> {

  @override
  Widget build(BuildContext context) {
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
              tag: '${guelphAttractions[widget.index]["title"]}',
              child: Image.network(
                guelphAttractions[widget.index]["imageURL"],
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.75),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          // Container(
          //   foregroundDecoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(guelphAttractions[widget.index]["imageURL"]),
          //       fit: BoxFit.fitHeight
          //     ),
          //   ),
          // ),
          // PhotoHero(
          //   photo: guelphAttractions[widget.index]["imageURL"],
          //   width: double.infinity,
          //   boxFit: BoxFit.fitHeight,
          //   onTap: () {},
          // ),

          // -- Black Opacity --
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.black.withOpacity(0.75),
          //     shape: BoxShape.rectangle,
          //   ),
          // ),

          // -- Attraction Content --
          ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
            children: <Widget>[
              // Title
              _buildBlock(vPad: 0.0, rows: <Row>[
                _buildRow(items: <Widget>[
                  Flexible(
                    child: Text(
                      guelphAttractions[widget.index]["title"],
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
                  for (var category in guelphAttractions[widget.index]["categories"]) Card(
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
                      guelphAttractions[widget.index]["description"],
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
                      guelphAttractions[widget.index]["address"],
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
                      guelphAttractions[widget.index]["isFree"] ? "Free" : "Not Free",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ]),

              // Add button
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: const Text("Add")
              //     )
              //   ],
              // ),

              _buildBlock(rows: <Row>[
                _buildRow(items: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
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
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
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