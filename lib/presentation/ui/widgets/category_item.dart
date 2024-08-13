import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.1),
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: Icon(
              Icons.computer,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        const Text(
          'Electronics',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
