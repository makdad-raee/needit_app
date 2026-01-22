class ProductsOfcategories {
  int? id;
  String? name;
  String? imageUrl;
  String? description;
  dynamic price;
  dynamic rate;
  int? totalSold;

  ProductsOfcategories(
      {this.name,
      this.imageUrl,
      this.id,
      this.description,
      this.price,
      this.rate,
      this.totalSold});

  ProductsOfcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    description = json['description'];
    price = json['price'];
    rate = json['rate'];
    totalSold = json['total_sold'];
  }
}
