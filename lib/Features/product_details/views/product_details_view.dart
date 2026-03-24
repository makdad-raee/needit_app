import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_event.dart';
import 'package:needit_app/Features/product_details/views/widgets/bottom_action_bar.dart';
import 'package:needit_app/Features/product_details/views/widgets/product_details_header.dart';
import 'package:needit_app/Features/product_details/views/widgets/product_title_and_rating.dart';
import 'package:needit_app/Features/product_details/views/widgets/quantity_section.dart';
import 'package:needit_app/Features/product_details/views/widgets/selected_color.dart';
import 'package:needit_app/Features/product_details/views/widgets/selected_size.dart';
import 'package:needit_app/core/get_products/Domain/entity/product_entity.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;
  String? selectedSize;
  int? selectedColor;

  @override
  void initState() {
    super.initState();
    // تعيين قيم افتراضية إذا كانت القوائم غير فارغة
    if (widget.product.sizes.isNotEmpty) selectedSize = widget.product.sizes[0];
    if (widget.product.colors.isNotEmpty) {
      selectedColor = widget.product.colors[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 1. الجزء العلوي (الصورة المتحركة)
              _buildSliverAppBar(context),
              // 2. تفاصيل المنتج
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageHeader(product: widget.product),
                      const SizedBox(height: 20),
                      ProductTitleAndRating(product: widget.product),
                      const SizedBox(height: 25),
                      _buildSelectors(),
                      const SizedBox(height: 25),
                      QuantitySection(
                        onChanged: (newquantity) {
                          setState(() => quantity = newquantity);
                        },
                      ),
                      const SizedBox(height: 100), // مساحة للـ Bottom Bar
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 3. شريط السعر والزر السفلي (ثابت)
          // _buildBottomActionBar(),
          BottomActionBar(
            price: widget.product.price,
            quantity: quantity,
            onPressed: () {
              context.read<CartBloc>().add(
                AddToCartEvent(
                  product: widget.product,
                  quantity: quantity,
                  selectedSize: selectedSize, // القياس اللي اختاره المستخدم
                  selectedColor: selectedColor, // اللون اللي اختاره المستخدم
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // --- Widgets التفصيلية ---

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      pinned: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: widget.product.id ?? '',
          child: Image.network(
            widget.product.imageUrl ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectors() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // قسم القياس
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              SelectedSize(
                sizes: widget.product.sizes,
                onSizeSelected: (size) {
                  setState(() {
                    selectedSize = size;
                  });
                  // تحديث القيمة النهائية
                },
              ),
            ],
          ),
        ),
        // قسم اللون
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Color",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              SelectedColor(
                product: widget.product,
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                  // تحديث القيمة النهائية
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
