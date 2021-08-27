import 'dart:convert';
import 'package:offline_first_app_flutter/models/item.dart';
import 'package:http/http.dart' as http;

class ItemService {
  final http.Client httpClient;
  ItemService({required this.httpClient});

  Future<List<Item>> fetchItems() async {
    final response =
        await httpClient.get(Uri.parse('http://localhost:5000/items'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Item.fromJson(json);
      }).toList();
    }
    throw Exception('error fetching items');
  }
}
