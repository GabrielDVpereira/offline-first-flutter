import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_bloc.dart';
import 'package:offline_first_app_flutter/bloc/item_event.dart';
import 'package:offline_first_app_flutter/components/organism/item_form.dart';
import 'package:offline_first_app_flutter/components/organism/item_list.dart';
import 'package:offline_first_app_flutter/constants/colors.dart';
import 'package:offline_first_app_flutter/models/item.dart';
import 'package:offline_first_app_flutter/services/items.dart';
import 'package:offline_first_app_flutter/utils/modal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final itemBloc = ItemBloc(service: ItemService());

  void _onSubmit(Item item) {
    itemBloc.add(ItemCreate(item: item));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => itemBloc..add(ItemFetched()),
      child: Scaffold(
        body: SafeArea(child: ItemList()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openModal(
                content: ItemForm(
                  onSubmit: _onSubmit,
                ),
                ctx: context);
          },
          tooltip: 'Add new item',
          child: Icon(
            Icons.add,
            color: CustomColors.white,
          ),
        ),
      ),
    );
  }
}
