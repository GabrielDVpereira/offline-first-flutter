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
      id: json['id'] as double,
      description: json['description'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    print('teste');
    return {
      'id': id,
      'description': description,
      'title': title,
    };
  }

  @override
  List<Object> get props => [id, title, description];
}
