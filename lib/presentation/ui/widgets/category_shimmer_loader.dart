import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utility/constrains.dart';

class CategoryShimmerLoader extends StatelessWidget {
  const CategoryShimmerLoader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white70,
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding))),
      ),
    );
  }
}
