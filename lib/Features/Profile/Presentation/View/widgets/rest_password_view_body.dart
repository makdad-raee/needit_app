import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class RestPasswordViewBody extends StatelessWidget {
  const RestPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ResetpassSection1(),
      // CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: ResetpassSection1(),
      //     ),
      //     // SliverList.builder(
      //     //   itemBuilder: (context, index) =>
      //     // )
      //   ],
      // ),
    );
  }
}

class ResetpassSection2 extends StatelessWidget {
  const ResetpassSection2({super.key, required this.via, required this.via2});
  final String via;
  final String via2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 122,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.8, color: Theme.of(context).primaryColor),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: Color(0xffEDEDED),
            child: SvgPicture.asset('assets/images/smssvg.svg'),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                via,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontFamily: kRubikRubikMedium,
                  color: Colors.black45,
                ),
              ),
              Text(
                via2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontFamily: kRubikRubikMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResetpassSection1 extends StatelessWidget {
  const ResetpassSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/resetpasspng.png',
          // width: double.infinity,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Select which contact details should\n we use to reset your password',
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikRegular,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ResetpassSection2(via: 'Via SMS', via2: '+963-96......85'),
        ResetpassSection2(via: 'via Email', via2: 'and****let@gmail.com'),
        // SizedBox(
        //   height: 25,
        // ),
        ContinueBottom(),
      ],
    );
  }
}
