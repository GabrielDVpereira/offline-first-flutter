import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_event.dart';
import 'package:offline_first_app_flutter/bloc/item_state.dart';
import 'package:offline_first_app_flutter/services/items.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemService service;
  ItemBloc({required this.service}) : super(const ItemState()) {
    on<ItemFetched>(_onItemsFetched);
    on<ItemCreate>(_onItemsCreate);
    on<ItemDelete>(_onItemsDelete);
  }

  _onItemsFetched(
    ItemFetched event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final items = await service.fetchItems();
      emit(state.copyWith(
        status: ItemStatus.success,
        items: items,
      ));
    } on Exception {
      emit(state.copyWith(status: ItemStatus.failure));
    }
  }

  _onItemsCreate(
    ItemCreate event,
    Emitter<ItemState> emit,
  ) async {
    try {
      final newItem = await service.createItem(event.item);
      final newItems = [...state.items, newItem];
      emit(state.copyWith(items: newItems));
    } on Exception {
      emit(state.copyWith(status: ItemStatus.failure));
    }
  }

  _onItemsDelete(
    ItemDelete event,
    Emitter<ItemState> emit,
  ) async {
    try {
      await service.deleteItem(event.id);
      final newItems =
          state.items.where((item) => item.id != event.id).toList();
      emit(state.copyWith(items: newItems));
    } on Exception {
      emit(state.copyWith(status: ItemStatus.failure));
    }
  }
}
