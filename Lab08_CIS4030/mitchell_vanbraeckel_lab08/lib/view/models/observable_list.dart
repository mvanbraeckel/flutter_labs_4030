import 'dart:collection';
import 'package:flutter/material.dart';

class ObservableList<T> extends ChangeNotifier {
  @protected
  final List<T> _list = [];

  ObservableList({List<T>? initialList}) {
    if (initialList != null) {
      addAll(initialList);
    }
  }

  UnmodifiableListView<T> get values => UnmodifiableListView(_list);

  /// Adds [element] to list. This and [removeAll] are the only ways to modify from the outside.
  void add(T element) {
    _list.add(element);
    notifyListeners(); // This call tells the widgets that are listening to this model to rebuild.
  }

  void remove(T element) {
    _list.remove(element);
    notifyListeners();
  }

  void addAll(List<T> toAdd) {
    _list.addAll(toAdd);
  }

  /// Removes all elements from the cart.
  void removeAll() {
    _list.clear();
    notifyListeners();
  }
}