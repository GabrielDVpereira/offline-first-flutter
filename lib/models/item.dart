import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final double id;
  final String title;
  final String description;
  bool isOffline;

  Item({
    required this.id,
    required this.description,
    required this.title,
    this.isOffline = false,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      description: json['description'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'description': this.description,
      'title': this.title,
    };
  }

  List<Object> get props => [id, title, description];
}
