import 'package:flutter/material.dart';

class SelectedSize extends StatefulWidget {
  final List<String> sizes;
  final Function(String) onSizeSelected;

  const SelectedSize({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  State<SelectedSize> createState() => _SelectedSizeState();
}

class _SelectedSizeState extends State<SelectedSize> {
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    // تعيين أول قياس كافتراضي
    if (widget.sizes.isNotEmpty) {
      selectedSize = widget.sizes[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.0, // المسافة الأفقية بين الدوائر
      runSpacing: 10.0, // المسافة الرأسية في حال نزل سطر جديد
      children:
          widget.sizes.map((size) {
            bool isSelected = selectedSize == size;
            return GestureDetector(
              onTap: () {
                setState(() => selectedSize = size);
                widget.onSizeSelected(size); // إرسال القياس المختار للأب
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.black : Colors.white,
                  border: Border.all(
                    color: isSelected ? Colors.black : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
