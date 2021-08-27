import 'package:equatable/equatable.dart';
import 'package:offline_first_app_flutter/models/item.dart';

enum ItemStatus { inital, success, failure }

class ItemState extends Equatable {
  final List<Item> items;
  final ItemStatus status;

  const ItemState({
    this.status = ItemStatus.inital,
    this.items = const <Item>[],
  });

  ItemState copyWith({
    ItemStatus? status,
    List<Item>? items,
    bool? hasReachedMax,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status posts: ${items.length} }''';
  }

  @override
  List<Object> get props => [status, items];
}
