import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/checkout/Presentation/view/payment_pin_verify_view.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class PaymentMethodeViewBody extends StatefulWidget {
  const PaymentMethodeViewBody({super.key});

  @override
  State<PaymentMethodeViewBody> createState() => _PaymentMethodeViewBodyState();
}

class _PaymentMethodeViewBodyState extends State<PaymentMethodeViewBody> {
  List<bool> isSelected = [false, false, false, false, false];
  changColor(int index) {
    setState(() {});
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Text(
              'Select the payment method you want to use',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikRegular,
                color: Colors.black45,
                fontSize: 16,
              ),
            ),
          ),
          SliverList.separated(
            itemCount: 5,
            itemBuilder:
                (context, index) => GestureDetector(
                  onTap: () {
                    changColor(index);
                    setState(() {});
                  },
                  child: PaymentMethodeItem(
                    text: "Google Pay",
                    SvgPath: 'assets/images/GrGoogle.svg',
                    isSelected: isSelected[index],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(height: 22),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ),
          SliverToBoxAdapter(
            child: ContinueBottom(
              text: 'Confirm Payment',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaymentPinVerifyView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodeItem extends StatelessWidget {
  const PaymentMethodeItem({
    super.key,
    this.SvgPath,
    required this.text,
    this.isSelected = false,
  });
  final String? SvgPath;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff00000017),

            spreadRadius: 0,
            blurRadius: 20,

            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                height: 25,
                SvgPath ?? 'assets/images/promosvg.svg',

                ///   color: kprimaryColor,
              ),
              // CircleAvatar(
              //   radius: 30,
              //   backgroundColor: Theme.of(context).primaryColor,
              //   child: SvgPicture.asset(
              //     SvgPath ?? 'assets/images/promosvg.svg',

              //     ///   color: kprimaryColor,
              //   ),
              // ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: kRubikRubikMedium,
                    ),
                  ),
                  // Text(
                  //   '61480 Sunbrook Park , PC 5679',
                  //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  //       fontSize: 12,
                  //       color: const Color(0xff9F9F9F),
                  //       fontWeight: FontWeight.w400,
                  //       fontFamily: kRubikRubikRegular),
                  // )
                ],
              ),
            ],
          ),
          Spacer(),

          SizedBox(width: 2),
          isSelected == false
              ? Icon(Icons.circle_outlined)
              : Icon(Icons.circle),
          // SvgPicture.asset('assets/images/editcheck.svg'),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
