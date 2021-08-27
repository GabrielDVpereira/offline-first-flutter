import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_event.dart';
import 'package:offline_first_app_flutter/bloc/item_state.dart';
import 'package:offline_first_app_flutter/models/item.dart';
import 'package:offline_first_app_flutter/services/items.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemService service;
  ItemBloc({required this.service}) : super(const ItemState());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is ItemFetched) {
      yield await _mapItemsFetchedToState(state);
    } else if (event is ItemCreate) {
      yield await _mapItemsCreateToState(state, event.item);
    }
  }

  Future<ItemState> _mapItemsFetchedToState(ItemState state) async {
    try {
      final items = await service.fetchItems();
      return state.copyWith(
        status: ItemStatus.success,
        items: items,
      );
    } on Exception {
      return state.copyWith(status: ItemStatus.failure);
    }
  }

  Future<ItemState> _mapItemsCreateToState(ItemState state, Item item) async {
    try {
      final newItem = await service.createItem(item);
      final newItems = [...state.items, newItem];
      return state.copyWith(items: newItems);
    } on Exception {
      return state.copyWith(status: ItemStatus.failure);
    }
  }
}
