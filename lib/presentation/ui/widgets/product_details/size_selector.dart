import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});
  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;
  @override
  void initState() {
    super.initState();
    _selectedSize = widget.sizes.first;
    widget.onChange(_selectedSize);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.sizes
          .map((s) => InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  _selectedSize = s;
                  widget.onChange(s);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black54),
                        color: s == _selectedSize
                            ? AppColors.primaryColor
                            : Colors.white),
                    child: Text(
                      s,
                      style: TextStyle(
                        color: s == _selectedSize ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
