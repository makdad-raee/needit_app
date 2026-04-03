import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_item_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_event.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/bottom_sheet_widget_for_delete.dart';
import 'package:needit_app/constant.dart';

class ProductItemForCart extends StatelessWidget {
  const ProductItemForCart({super.key, required this.cartItem});

  // غيرنا الاسم ليكون أوضح (عنصر واحد من السلة)
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        height: 152,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 20)],
        ),
        child: Row(
          children: [
            // صورة المنتج
            _buildProductImage(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // اسم المنتج وحذف العنصر
                    _buildNameAndDelete(context),
                    // 2. اللون والقياس) لو موجودين
                    _buildAttributes(),
                    // السعر والتحكم بالكمية
                    _buildPriceAndCounter(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade100,
        ),
        child: Image.network(
          cartItem.productEntity.imageUrl ?? '',
          fit: BoxFit.contain,
          // إضافة placeholder في حال فشل تحميل الصورة
          errorBuilder:
              (context, error, stackTrace) => const Icon(Icons.broken_image),
        ),
      ),
    );
  }

  Widget _buildNameAndDelete(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            cartItem.productEntity.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        IconButton(
          onPressed: () {
            // انادي هنا الـ BottomSheet أو الـ Event بتاع الحذف مباشرة
            _showBottomSheet(context);
          },
          icon: const Icon(Icons.delete_outline, color: Colors.red),
        ),
      ],
    );
  }

  Widget _buildPriceAndCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // السعر الإجمالي لهذا العنصر (الكمية × السعر)
        Text(
          '${(cartItem.quantity * cartItem.productEntity.price).toStringAsFixed(2)} \$',
          style: const TextStyle(
            fontFamily: kRubikBold,
            fontSize: 16,
            color: kprimaryColor,
          ),
        ),

        // أزرار التحكم
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (cartItem.quantity > 1) {
                    context.read<CartBloc>().add(
                      UpdateQuantityEvent(cartItem, cartItem.quantity - 1),
                    );
                  }
                },
                icon: const Icon(Icons.remove, size: 20),
              ),
              Text(
                '${cartItem.quantity}', // الكمية الحقيقية من الـ Entity
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                    UpdateQuantityEvent(cartItem, cartItem.quantity + 1),
                  );
                },
                icon: const Icon(Icons.add, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => BottomsheetWidgetForDelete(
            cartItem:
                cartItem, // تأكد من تعديل الـ Widget المستقبلة لتأخذ Item واحد
          ),
    );
  }

  Widget _buildAttributes() {
    // إذا كان المنتج ما إلو لا لون ولا قياس، ما بنعرض شي
    if (cartItem.selectedSize == null && cartItem.selectedColor == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        // عرض القياس (إذا وجد)
        if (cartItem.selectedSize != null) ...[
          Text(
            'Size: ${cartItem.selectedSize}',
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(width: 12), // مسافة بين القياس واللون
        ],

        // عرض اللون كدائرة (إذا وجد)
        if (cartItem.selectedColor != null) ...[
          const Text(
            'Color: ',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Color(cartItem.selectedColor!), // تحويل الـ int للون
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),
        ],
      ],
    );
  }
}
