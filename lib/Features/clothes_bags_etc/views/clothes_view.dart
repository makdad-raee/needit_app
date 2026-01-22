import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/clothes_bags_etc/views/widgets/clothes_view_body.dart';
import 'package:needit_app/constant.dart';

class CategoryViewOfmain extends StatelessWidget {
  const CategoryViewOfmain({super.key, required this.clothes});
  final List<ProductEntityCategory> clothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Clothes',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kSwiss721Bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.search, size: 30, color: kprimaryColor),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CategoryViewOfmainBody(clothes: clothes),
      ),
    );
  }
}
