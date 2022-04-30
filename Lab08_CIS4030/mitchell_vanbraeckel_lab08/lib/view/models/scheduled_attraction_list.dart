import 'package:flutter/material.dart';

class ScheduledAttractionList extends ChangeNotifier {
  List scheduledAttractions = [];

  void updateScheduledAttractions(List updatedScheduledAttractions) {
    scheduledAttractions = List.from(updatedScheduledAttractions);
    notifyListeners();
  }

  void add(Map newAttraction) {
    scheduledAttractions.add(newAttraction);
    notifyListeners();
  }
}