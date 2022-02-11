import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_event.dart';
import 'package:offline_first_app_flutter/bloc/item_state.dart';
import 'package:offline_first_app_flutter/components/atoms/text.dart';
import 'package:offline_first_app_flutter/components/molecule/item_card.dart';
import 'package:offline_first_app_flutter/components/molecule/item_skeleton.dart';
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
      return const Text("You don't have any items");
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

  Widget _renderItemsSkeleton() {
    return ListView.separated(
      itemBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: ItemCardSkeleton(),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: 5,
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 26),
              const CustomText.title('Offline first app ✨'),
              const SizedBox(height: 20),
              state.status == ItemStatus.success
                  ? _renderListOrEmptyMessge(state.items)
                  : _renderItemsSkeleton(),
            ],
          ),
        );
      },
    );
  }
}
