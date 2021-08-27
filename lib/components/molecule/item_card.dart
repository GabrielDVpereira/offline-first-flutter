import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/components/atoms/card.dart';
import 'package:offline_first_app_flutter/components/atoms/text.dart';
import 'package:offline_first_app_flutter/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final bool isOffline;
  final void Function(Item) onDismiss;

  const ItemCard({
    required this.item,
    required this.onDismiss,
    this.isOffline = false,
    Key? key,
  }) : super(key: key);

  Widget _renderOfflineIndicator() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red,
        ),
        height: 10,
        width: 10,
      ),
    );
  }

  Widget _renderCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText.title(
          item.title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        CustomText.paragraph(
          item.description,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onDismiss: () => onDismiss(item),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            _renderCardContent(),
            if (isOffline) _renderOfflineIndicator(),
          ],
        ),
      ),
    );
  }
}
