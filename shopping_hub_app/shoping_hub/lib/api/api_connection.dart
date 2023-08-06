import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_hub/model/category_model.dart';

import '../../model/item_model.dart';

String baseUrl = 'https://dummyjson.com';

class ApiConnection {
  static Future<List<Category>> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/products/categories'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse
            .map((item) => Category(name: item.toString()))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      print('error $error');
      rethrow;
    }
  }

  static Future<List<Item>> getItemsByCategory(String category) async {
    var response = await http.get(
      Uri.parse('$baseUrl/products/category/$category'),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse is Map<String, dynamic>) {
        // If the response is a Map, it's probably an object that contains a list of items.
        if (jsonResponse.containsKey('products') &&
            jsonResponse['products'] is List) {
          // If the Map contains a key 'products' that is a List, it's probably a list of items.
          return (jsonResponse['products'] as List)
              .map((item) => Item.fromJson(item))
              .toList();
        } else {
          // If the Map does not contain a key 'products' that is a List, it's something unexpected.
          // You can handle this case as appropriate for your application.
          throw Exception('Unexpected response from API: $jsonResponse');
        }
      } else {
        // If the response is not a Map, it's something completely unexpected.
        // You can handle this case as appropriate for your application.
        throw Exception('Unexpected response from API: $jsonResponse');
      }
    } else {
      throw Exception('Failed to load items');
    }
  }
}
