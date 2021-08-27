import 'dart:convert';
import 'package:offline_first_app_flutter/models/item.dart';
import 'package:http/http.dart' as http;

class ItemService {
  final Uri url = Uri.parse('http://localhost:5000/items');
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<List<Item>> fetchItems() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body.map((dynamic json) {
        return Item.fromJson(json);
      }).toList();
    }
    throw Exception('error fetching items');
  }

  Future<Item> createItem(Item item) async {
    final response = await http.post(
      url,
      body: jsonEncode(item.toJson()),
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      return item;
    }
    throw Exception('error creating items');
  }
}
