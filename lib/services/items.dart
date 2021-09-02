import 'dart:convert';
import 'package:offline_first_app_flutter/models/item.dart';
import 'package:http/http.dart' as http;

class ItemService {
  final Uri url = Uri.parse('http://localhost:5000/items');
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Uri _getUri({String? id}) {
    if (id != null) {
      return Uri.parse('http://localhost:5000/items/$id');
    }
    return Uri.parse('http://localhost:5000/items');
  }

  Future<List<Item>> fetchItems() async {
    final response = await http.get(_getUri());

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body.map((dynamic json) {
        return Item.fromJson(json as Map<String, dynamic>);
      }).toList();
    }
    throw Exception('error fetching items');
  }

  Future<Item> createItem(Item item) async {
    final response = await http.post(
      _getUri(),
      body: jsonEncode(item.toJson()),
      headers: headers,
    );
    if (response.statusCode == 201) {
      return item;
    }
    throw Exception('error creating items');
  }

  Future<void> deleteItem(double id) async {
    await http.delete(_getUri(id: id.toString()));
  }
}
