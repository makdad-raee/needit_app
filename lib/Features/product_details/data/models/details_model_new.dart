import 'package:needit_app/Features/Shopping/data/models/category_model.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/presentation/bloc/models/colors_new_model.dart';
import 'package:needit_app/Features/product_details/presentation/bloc/models/sizes_new_model.dart';

class DetailsModelTdd extends DetailsEntity {
  const DetailsModelTdd({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.price,
    required super.rate,
    required super.totalSold,
    required super.category,
    required super.colors,
    required super.sizes,
  });
  factory DetailsModelTdd.fromJson(Map<String, dynamic> json) {
    return DetailsModelTdd(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: json['price'],
      rate: json['rate'],
      totalSold: json['total_sold'],
      category: CategoryModel.fromJson(json['category']),
      colors:
          (json['colors'] as List<dynamic>)
              .map((e) => ColorsNewModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      sizes:
          (json['sizes'] as List<dynamic>)
              .map((e) => SizesNewModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'rate': rate,
      'total_sold': totalSold,
      'category': category,
      'colors':
          colors?.map((e) {
            ColorsNewModel colorsNewModel = ColorsNewModel(
              id: e.id,
              hex: e.hex,
              name: e.name,
            );
            colorsNewModel.toJson();
            // => {
            //       'id': e.id,
            //       'hex': e.hex,
            //       'name': e.name,
            //     };
            return colorsNewModel.toJson();
          }).toList(),
      'sizes':
          sizes?.map((e) {
            SizesNewModel sizesNewModel = SizesNewModel(
              id: e.id,
              name: e.name,
              shortcut: e.shortcut,
            );
            sizesNewModel.toJson();
            // => {
            //       'id': e.id,
            //       'name': e.name,
            //       'shortcut': e.shortcut,
            //     };
            return sizesNewModel.toJson();
          }).toList(),
    };
  }
}
