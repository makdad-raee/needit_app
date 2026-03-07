import 'package:equatable/equatable.dart';
import 'package:needit_app/Features/checkout/Data/models/addres_model.dart';
import 'package:needit_app/Features/checkout/Data/models/payment_methode_model.dart';
import 'package:needit_app/Features/checkout/Data/models/promo_code_model.dart';
import 'package:needit_app/Features/checkout/Data/models/shipping_methode_model.dart';

class CheckoutState extends Equatable {
  // 1. البيانات والقوائم (Lists & Selection)
  final List<AddressModel> addresses;
  final AddressModel? selectedAddress;

  final List<ShippingMethodModel> shippingMethods;
  final ShippingMethodModel? selectedShippingMethod;

  final List<PaymentMethodModel> paymentMethods;
  final PaymentMethodModel? selectedPaymentMethod;

  final PromoCodeModel? appliedPromo;

  // 2. المبالغ المالية (Financials)
  final double subTotal; // سعر المنتجات فقط
  final double shippingFee; // تكلفة الشحن المختارة
  final double discountAmount; // قيمة الخصم المستخرجة من البرومو
  final double totalAmount; // المبلغ النهائي الصافي

  // 3. حالة العملية (Status)
  final bool isLoading;
  final String? errorMessage;
  final bool isOrderSuccess; // للتنقل لشاشة النجاح في الفيجما

  const CheckoutState({
    this.addresses = const [],
    this.selectedAddress,
    this.shippingMethods = const [],
    this.selectedShippingMethod,
    this.paymentMethods = const [],
    this.selectedPaymentMethod,
    this.appliedPromo,
    this.subTotal = 0,
    this.shippingFee = 0,
    this.discountAmount = 0,
    this.totalAmount = 0,
    this.isLoading = false,
    this.errorMessage,
    this.isOrderSuccess = false,
  });

  // ميثود ذكية لحساب الفاتورة تلقائياً عند تغيير أي معطى
  // تساعدنا في الحفاظ على الـ Logic بعيداً عن الـ UI
  CheckoutState calculateTotals() {
    // حساب الخصم
    double discount = 0;
    if (appliedPromo != null) {
      discount = subTotal * (appliedPromo!.discountPercentage / 100);
    }

    // حساب الشحن
    double shipping = selectedShippingMethod?.price ?? 0;

    // المبلغ النهائي
    double total = (subTotal + shipping) - discount;

    return copyWith(
      discountAmount: discount,
      shippingFee: shipping,
      totalAmount: total < 0 ? 0 : total, // ضمان عدم وجود رقم سالب
    );
  }

  // الـ copyWith لتحديث أجزاء معينة من الـ State
  CheckoutState copyWith({
    List<AddressModel>? addresses,
    AddressModel? selectedAddress,
    List<ShippingMethodModel>? shippingMethods,
    ShippingMethodModel? selectedShippingMethod,
    List<PaymentMethodModel>? paymentMethods,
    PaymentMethodModel? selectedPaymentMethod,
    PromoCodeModel? appliedPromo,
    double? subTotal,
    double? shippingFee,
    double? discountAmount,
    double? totalAmount,
    bool? isLoading,
    String? errorMessage,
    bool? isOrderSuccess,
  }) {
    return CheckoutState(
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      shippingMethods: shippingMethods ?? this.shippingMethods,
      selectedShippingMethod:
          selectedShippingMethod ?? this.selectedShippingMethod,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      appliedPromo: appliedPromo ?? this.appliedPromo,
      subTotal: subTotal ?? this.subTotal,
      shippingFee: shippingFee ?? this.shippingFee,
      discountAmount: discountAmount ?? this.discountAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage, // نسمح بمرور null لمسح الخطأ
      isOrderSuccess: isOrderSuccess ?? this.isOrderSuccess,
    );
  }

  @override
  List<Object?> get props => [
    addresses,
    selectedAddress,
    shippingMethods,
    selectedShippingMethod,
    paymentMethods,
    selectedPaymentMethod,
    appliedPromo,
    subTotal,
    shippingFee,
    discountAmount,
    totalAmount,
    isLoading,
    errorMessage,
    isOrderSuccess,
  ];
}
