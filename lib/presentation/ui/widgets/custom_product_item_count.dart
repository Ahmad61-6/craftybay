import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProductItemCount extends StatefulWidget {
  CustomProductItemCount({
    super.key,
  });

  final ValueNotifier<int> noOfItems = ValueNotifier(1);

  @override
  State<CustomProductItemCount> createState() => _CustomProductItemCountState();
}

class _CustomProductItemCountState extends State<CustomProductItemCount> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: widget.noOfItems,
        builder: (context, value, _) {
          return Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                onTap: () {
                  if (value > 1) {
                    widget.noOfItems.value = value - 1;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  '${widget.noOfItems.value}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                onTap: () {
                  widget.noOfItems.value = value + 1;
                },
              ),
            ],
          );
        });
  }
}
