import 'package:flutter/material.dart';
import 'package:mitchell_vanbraeckel_lab08/view/models/attraction_list.dart';

class ActiveFiltersMap extends ChangeNotifier {
  Map activeFilters = {};

  void updateActiveFilters(Map dialogFiltersCopy, AttractionList attractionList) {
    // Get new set of active filters
    activeFilters = Map.from(dialogFiltersCopy);

    // Adds any new categories and sets the filter tag state to selected
    for (var attraction in attractionList.guelphAttractions) {
      for (var category in attraction["categories"]) {
        if (!activeFilters.containsKey(category)) {
          activeFilters[category] = true;
        }
      }
    }

    notifyListeners();
  }
}