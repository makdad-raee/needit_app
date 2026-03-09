import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_state.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/ammount_shipping_total.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_location.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/checkout_shiping_type.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/promo_code.dart';
import 'package:needit_app/Features/checkout/Presentation/view/chose_shipping_view.dart';
import 'package:needit_app/constant.dart';

class CheckOutViewBodySection1 extends StatelessWidget {
  const CheckOutViewBodySection1({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. نغلف العمود بـ BlocBuilder عشان "نسمع" لأي تغيير في الخيارات
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الموقع المختار
              const CheckoutLocation(),
              const SizedBox(height: 18),

              Text(
                'Choose Shipping',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 18),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => BlocProvider.value(
                            value: context.read<CheckoutBloc>(),
                            child: const ChoseShippingView(),
                          ),
                    ),
                  );
                },
                // هاد الـ Widget رح يعرض "نوع الشحن المختار" من الـ state تلقائياً
                child: const CheckoutShipingType(),
              ),

              const SizedBox(height: 18),

              // 2. هون "السحر": بدل 'Parent’s House' الثابتة
              // منخليها تعرض الـ title تبع العنوان المختار حالياً
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.selectedAddress?.title ?? 'Select Address',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: kRubikBold,
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 18),
              // ... باقي الـ Promo Code والـ Amounts ...
              const PromoCode(),
              const SizedBox(height: 40),

              // هاد الـ Widget صار يقرأ الأرقام الحقيقية (Subtotal + Shipping)
              const AmmountShippingTotal(),

              const SizedBox(height: 40),
              const Divider(thickness: 1, color: Color(0xffEDEDED)),
              const SizedBox(height: 24),
              Text(
                'Order List',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        );
      },
    );
  }
}
