import 'package:flutter/material.dart';

void openModal({
  required Widget content,
  required BuildContext ctx,
}) {
  final double bottom = MediaQuery.of(ctx).size.height * 0.3;
  showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.only(
          bottom: bottom,
          left: 16,
          right: 16,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: content,
        ),
      );
    },
  );
}
