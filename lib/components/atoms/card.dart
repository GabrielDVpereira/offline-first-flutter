import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final void Function()? onDismiss;
  const CustomCard({Key? key, required this.child, this.onDismiss})
      : super(key: key);

  DismissDirection _getDismissDirection() {
    if (this.onDismiss != null) {
      return DismissDirection.endToStart;
    }
    return DismissDirection.none;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();
    return Dismissible(
      onDismissed: (DismissDirection dismiss) {
        if (dismiss == DismissDirection.endToStart) onDismiss!();
      },
      key: key,
      direction: _getDismissDirection(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 80,
            maxHeight: MediaQuery.of(context).size.height * 0.3,
            minWidth: double.infinity,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
            child: child,
          ),
        ),
      ),
    );
  }
}
