import 'package:flutter/material.dart';

class FilterTag extends StatefulWidget {
  final String tagText;
  const FilterTag({Key? key, required this.tagText}) : super(key: key);

  @override
  State<FilterTag> createState() => _FilterTagState();
}

class _FilterTagState extends State<FilterTag> {

  // Attributes
  bool _isTagSelected = true;

  void _selectTag() {
    setState(() {
      _isTagSelected = !_isTagSelected; // Toggle when tapped.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          setState(() => _selectTag());
        },
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                color: _isTagSelected ? Colors.blueGrey[100] : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(widget.tagText),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Icon(
                Icons.check_circle,
                color: _isTagSelected ? Colors.black : Colors.transparent,
                size: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
