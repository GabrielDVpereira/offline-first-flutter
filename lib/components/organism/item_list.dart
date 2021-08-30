import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_event.dart';
import 'package:offline_first_app_flutter/bloc/item_state.dart';
import 'package:offline_first_app_flutter/components/atoms/text.dart';
import 'package:offline_first_app_flutter/components/molecule/item_card.dart';
import 'package:offline_first_app_flutter/models/item.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late ItemBloc _itemBloc;

  @override
  void initState() {
    super.initState();
    _itemBloc = context.read<ItemBloc>();
  }

  Widget _renderListOrEmptyMessge(List<Item> items) {
    if (items.isEmpty) {
      return Text("You don't have any items");
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        return ItemCard(
          item: items[i],
          onDismiss: (Item item) {
            _itemBloc.add(ItemDelete(id: item.id));
          },
        );
      },
      itemCount: items.length,
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state.status == ItemStatus.success) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 26),
                CustomText.title('Offline first app ✨'),
                SizedBox(height: 20),
                _renderListOrEmptyMessge(state.items)
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
