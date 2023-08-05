import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemModel extends ChangeNotifier {

 List<Item> _items = [];

 List<Item> get items => _items;

 void setItems(List<Item> items) {
  _items = items;
  notifyListeners();
 }

 }

class Item {
 final int id;
 final String title;
 final double price;
 final String brand;
 final String category;
 final String image;

 Item({
  required this.id,
  required this.title,
  required this.price,
  required this.brand,
  required this.category,
  required this.image,
 });

 factory Item.fromJson(Map<String, dynamic> json) {
  return Item(
   id: json['id'],
   title: json['title'],
   price: json['price'].toDouble(),
   brand: json['brand'],
   category: json['category'],
   image: json['images'][0],
  );
 }
}