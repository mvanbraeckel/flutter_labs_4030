import 'package:flutter/material.dart';

class AttractionList extends ChangeNotifier {
  List guelphAttractions = [];

  void updateGuelphAttractions(List updatedGuelphAttractions) {
    guelphAttractions = List.from(updatedGuelphAttractions);
    notifyListeners();
  }

  void add(Map newAttraction) {
    guelphAttractions.add(newAttraction);
    notifyListeners();
  }
}