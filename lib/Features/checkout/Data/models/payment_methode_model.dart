class PaymentMethodModel {
  final String name;
  final String iconPath; // لمطابقة الأيقونات في الفيجما
  final bool isSelected;

  const PaymentMethodModel({
    required this.name,
    required this.iconPath,
    this.isSelected = false,
  });

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      name: map['name'] ?? '',
      iconPath: map['iconPath'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'iconPath': iconPath, 'isSelected': isSelected};
  }
}
