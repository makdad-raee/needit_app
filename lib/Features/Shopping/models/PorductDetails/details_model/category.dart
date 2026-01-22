class Category {
  int? id;
  dynamic key;
  String? name;
  dynamic description;
  String? imageUrl;
  dynamic discount;

  Category({
    this.id,
    this.key,
    this.name,
    this.description,
    this.imageUrl,
    this.discount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        key: json['key'] as dynamic,
        name: json['name'] as String?,
        description: json['description'] as dynamic,
        imageUrl: json['image_url'] as String?,
        discount: json['discount'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'discount': discount,
      };
}
