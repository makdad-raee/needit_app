class PromoCodeModel {
  final String code;
  final double discountPercentage;
  final String description;

  const PromoCodeModel({
    required this.code,
    required this.discountPercentage,
    required this.description,
  });

  factory PromoCodeModel.fromMap(Map<String, dynamic> map) {
    return PromoCodeModel(
      code: map['code'] ?? '',
      discountPercentage: (map['discountPercentage'] ?? 0.0).toDouble(),
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'discountPercentage': discountPercentage,
      'description': description,
    };
  }
}
