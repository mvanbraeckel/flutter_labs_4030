import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab_seven_a/attractions.dart';
// import 'package:mitchell_vanbraeckel_lab_seven_a/main.dart';

class AddAttractionPage extends StatefulWidget {
  const AddAttractionPage({Key? key}) : super(key: key);

  @override
  State<AddAttractionPage> createState() => _AddAttractionPageState();
}

class _AddAttractionPageState extends State<AddAttractionPage> {

  // Attributes
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  bool _isFreeSwitchValue = false;
  final TextStyle _headerStyle = const TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
  final TextEditingController _attractionTitleField = TextEditingController();
  final TextEditingController _bgImgField = TextEditingController();
  final TextEditingController _categoriesField = TextEditingController();
  final TextEditingController _addressField = TextEditingController();
  final TextEditingController _descriptionField = TextEditingController();

  // Functions
  void _toggleIsFreeSwitch(bool value) {
    setState(() {
      _isFreeSwitchValue = !_isFreeSwitchValue;
    });
  }

  String? _formTextFieldValidator(var value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  void dispose() {
    _attractionTitleField.dispose();
    _bgImgField.dispose();
    _categoriesField.dispose();
    _addressField.dispose();
    _descriptionField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Attraction"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                // -- Attraction Title --
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Attraction Title", style: _headerStyle),
                ),
                TextFormField(
                  controller: _attractionTitleField,
                  // The validator receives the text that the user has entered.
                  validator: (value) => _formTextFieldValidator(value),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                // -- Background Image --
                Padding (
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Background Image", style: _headerStyle),
                  ),
                ),
                TextFormField(
                  controller: _bgImgField,
                  validator: (value) => _formTextFieldValidator(value),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                // -- Categories --
                Padding (
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Categories", style: _headerStyle),
                  ),
                ),
                TextFormField(
                  controller: _categoriesField,
                  validator: (value) => _formTextFieldValidator(value),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                // -- Address --
                Padding (
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Address", style: _headerStyle),
                  ),
                ),
                TextFormField(
                  controller: _addressField,
                  validator: (value) => _formTextFieldValidator(value),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                // -- Description --
                Padding (
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Description", style: _headerStyle),
                  ),
                ),
                TextFormField(
                  maxLines: 5,
                  controller: _descriptionField,
                  validator: (value) => _formTextFieldValidator(value),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                // -- Is Free --
                _buildBlock(rows: <Row>[
                  _buildRow(items: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Is Free", style: _headerStyle),
                    ),
                    Expanded(
                      // alignment: Alignment.center,
                      child: Switch(value: _isFreeSwitchValue, onChanged: _toggleIsFreeSwitch),
                    ),
                  ]),
                ]),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                // -- Form Button --
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, create an attraction item
                      // debugPrint(_isFreeSwitchValue.toString()); //good
                      Map attractionToAdd = {
                        "title": _attractionTitleField.text,
                        "imageURL": _bgImgField.text,
                        // "imageURL": "http://img03.deviantart.net/a40d/i/2008/003/e/b/random_field_002_by_mourge_stawk.jpg",
                        "categories": [
                          _categoriesField.text,
                        ],
                        "address": _addressField.text,
                        "description": _descriptionField.text,
                        "isFree": _isFreeSwitchValue ? true : false,
                        // "isFree": true,
                      };
                      // debugPrint(attractionToAdd.toString()); //good
                      guelphAttractions.add(attractionToAdd);
                      // Adds any new categories and sets the filter tag state to check
                      for (var attraction in guelphAttractions) {
                        for (var category in attraction["categories"]) {
                          if (!activeFilters.containsKey(category)) {
                            activeFilters[category] = true;
                          }
                        }
                      }

                      // If the form is valid, display a snackbar.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Attraction Added')),
                      );
                      Navigator.pop(context, 'Attraction Added');
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBlock({double hPad=0.0, double vPad=8.0, required List<Row> rows}) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        children: <Widget>[
          for (var row in rows) Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0), // 4.0
            child: row
          )
        ],
      ),
    );
  }

  Row _buildRow({required List<Widget> items}) {
    return Row(
      children: <Widget>[
        for (var item in items) item
      ],
    );
  }


}