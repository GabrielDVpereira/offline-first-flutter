import 'package:flutter/material.dart';
import 'package:offline_first_app_flutter/components/atoms/skeleton.dart';

class ItemCardSkeleton extends StatelessWidget {
  const ItemCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      height: 100,
    );
  }
}
