import 'package:equatable/equatable.dart';
import 'package:offline_first_app_flutter/models/item.dart';

abstract class ItemEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemFetched extends ItemEvent {}

class ItemCreate extends ItemEvent {
  final Item item;
  ItemCreate({required this.item});
}
