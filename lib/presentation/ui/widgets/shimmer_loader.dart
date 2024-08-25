import 'package:crafty_bay/presentation/ui/utility/constrains.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white70,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding))),
      ),
    );
  }
}
