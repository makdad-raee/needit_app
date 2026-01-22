import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class PromoCodeViewBody extends StatefulWidget {
  const PromoCodeViewBody({super.key});

  @override
  State<PromoCodeViewBody> createState() => _PromoCodeViewBodyState();
}

class _PromoCodeViewBodyState extends State<PromoCodeViewBody> {
  List<bool> isSelected = [false, false, false, false, false];
  changecolor(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: 5,
            itemBuilder:
                (context, index) => GestureDetector(
                  onTap: () {
                    changecolor(index);
                  },
                  child: PrpomoItem(
                    text: 'Discount 30% off',
                    isSelected: isSelected[index],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(height: 22),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ),
          SliverToBoxAdapter(child: ContinueBottom(text: 'Apply')),
        ],
      ),
    );
  }
}

class PrpomoItem extends StatelessWidget {
  final bool isSelected;
  const PrpomoItem({
    super.key,
    this.SvgPath,
    required this.text,
    this.isSelected = false,
  });
  final String? SvgPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
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
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: SvgPicture.asset(
                  SvgPath ?? 'assets/images/promosvg.svg',

                  ///   color: kprimaryColor,
                ),
              ),
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
                  Text(
                    '61480 Sunbrook Park , PC 5679',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                      color: const Color(0xff9F9F9F),
                      fontWeight: FontWeight.w400,
                      fontFamily: kRubikRubikRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),

          SizedBox(width: 2),
          isSelected == true ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
          // SvgPicture.asset('assets/images/editcheck.svg'),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
