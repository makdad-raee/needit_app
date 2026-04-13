import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_event.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_state.dart';
import 'package:needit_app/Features/checkout/Presentation/view/edit_adress_view.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class ShippingAddressBody extends StatelessWidget {
  final bool isFromProfile;

  const ShippingAddressBody({super.key, this.isFromProfile = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder:
          (context, state) => Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList.separated(
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 22),
                      itemCount:
                          state
                              .addresses
                              .length, // تأكد أن الـ Bloc يحتوي على عناوين للتجربة
                      itemBuilder: (context, index) {
                        final address = state.addresses[index];
                        bool isSelected = state.selectedAddress == address;

                        return GestureDetector(
                          onTap: () {
                            if (!isFromProfile) {
                              // فقط في الـ Checkout نغير العنوان المحدد
                              context.read<CheckoutBloc>().add(
                                SelectShippingAddress(address),
                              );
                            }
                          },
                          child: AddressItem(
                            address: address,
                            isSelected: isSelected,
                            isFromProfile: isFromProfile, // نمرر المتغير
                            addressName: address.title,
                            addressDetails: address.addressLine,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              ShippingBodySection2(
                isFromProfile: isFromProfile,
              ), // نمرر المتغير
            ],
          ),
    );
  }
}

// 3. قسم الأزرار السفلية
class ShippingBodySection2 extends StatelessWidget {
  final bool isFromProfile;

  const ShippingBodySection2({super.key, this.isFromProfile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        ContinueBottom(
          // أو ContinueButton
          containerColor: const Color(0xffEDEDED),
          text: 'Add New Address',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditAddressView()),
            );
            // الانتقال لشاشة إضافة عنوان جديد (خريطة)
          },
        ),
        const SizedBox(height: 18), // مسافة بديلة عشان لو اختفى الزر الثاني
        // إخفاء زر Apply لو كنا في الـ Profile
        if (!isFromProfile) ...[
          const SizedBox(height: 42),
          ContinueBottom(
            text: 'Apply',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 18),
        ],
      ],
    );
  }
}

// 4. عنصر العنوان (Address Item)
class AddressItem extends StatelessWidget {
  final bool isSelected;
  final bool isFromProfile;
  final String addressName;
  final String addressDetails;
  final AddressEntity address;

  const AddressItem({
    super.key,
    this.isSelected = false,
    this.isFromProfile = false,
    required this.addressName,
    required this.addressDetails,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // التحديد (Border) يظهر فقط إذا كان محددًا ومو في شاشة الـ Profile
        border:
            (isSelected && !isFromProfile)
                ? Border.all(color: Theme.of(context).primaryColor, width: 2)
                : null,
        boxShadow: const [
          BoxShadow(
            color: Color(0xff00000017),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: SvgPicture.asset('assets/images/locationcheck.svg'),
          ),
          const SizedBox(width: 13),
          Expanded(
            // Expanded هنا عشان لو العنوان طويل ما يعمل Overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  address.title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: kRubikRubikMedium,
                  ),
                ),
                Text(
                  address.addressLine,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 12,
                    color: const Color(0xff9F9F9F),
                    fontWeight: FontWeight.w400,
                    fontFamily: kRubikRubikRegular,
                  ),
                ),
              ],
            ),
          ),

          // عرض قلم التعديل في الـ Profile، وعرض دوائر التحديد في الـ Checkout
          if (isFromProfile)
            GestureDetector(
              onTap: () {
                // فتح شاشة تعديل هذا العنوان
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAddressView(address: address),
                  ),
                );
              },
              child: const Icon(Icons.edit, size: 20, color: Colors.black54),
              // child: SvgPicture.asset('assets/images/editcheck.svg'), // إذا أردت الـ SVG الخاص بك
            )
          else
            Icon(isSelected ? Icons.circle : Icons.circle_outlined),

          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
