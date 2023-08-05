import 'dart:convert';

import 'package:flutter/material.dart';

class CategoryModel extends ChangeNotifier {
  // List of categories
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  void setCategories(List<Category> categories) {
    _categories = categories;
    notifyListeners();
  }
}

class Category {
  final String name;

  Category({required this.name});
}

