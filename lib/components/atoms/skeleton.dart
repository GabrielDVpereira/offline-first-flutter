import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double? height, width;

  const Skeleton({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
