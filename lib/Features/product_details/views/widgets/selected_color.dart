import 'package:flutter/material.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class SelectedColor extends StatefulWidget {
  final ProductEntity product;
  final Function(int) onColorSelected; // إضافة لإخبار الأب باللون المختار

  const SelectedColor({
    super.key,
    required this.product,
    required this.onColorSelected,
  });

  @override
  State<SelectedColor> createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedColor> {
  int? selectedColor; // تعريف المتغير هنا داخل الـ State

  @override
  void initState() {
    super.initState();
    // تعيين أول لون كافتراضي إذا كانت القائمة غير فارغة
    if (widget.product.colors.isNotEmpty) {
      selectedColor = widget.product.colors[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.0, // المسافة الأفقية بين الدوائر
      runSpacing: 10.0, // المسافة الرأسية في حال نزل سطر جديد
      children:
          widget.product.colors.map((colorValue) {
            bool isSelected = selectedColor == colorValue;
            return GestureDetector(
              onTap: () {
                setState(() => selectedColor = colorValue);
                widget.onColorSelected(colorValue); // إرسال اللون المختار للأب
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      isSelected
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(colorValue),
                  child:
                      isSelected
                          ? const Icon(
                            Icons.check,
                            size: 14,
                            color: Colors.white,
                          )
                          : null,
                ),
              ),
            );
          }).toList(),
    );
  }
}
