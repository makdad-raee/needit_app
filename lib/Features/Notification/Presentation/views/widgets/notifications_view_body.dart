import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/constant.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Swiss',
            ),
          ),
          const SizedBox(height: 22),
          const NotificationItem(),
          const SizedBox(height: 22),
          const Text('Yesterday', style: ktextStyle16),
          const SizedBox(height: 22),
          const NotificationItem(),
          const SizedBox(height: 22),
          const NotificationItem(),
          const SizedBox(height: 22),
          Text(
            'December 22, 2024',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Swiss',
            ),
          ),
          const SizedBox(height: 22),
          const NotificationItem(),
          const SizedBox(height: 22),
          const NotificationItem(),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
      height: 88,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            // Color(0xff00000017),
            spreadRadius: 1,
            //  /   blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        // boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.1), blurRadius: 5)],
        border: Border.all(width: 1, color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: SvgPicture.asset(
              'assets/images/solar_wallet-bold.svg',

              ///   color: kprimaryColor,
            ),
          ),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Top Up E-Wallet Successful!',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: kRubikRubikMedium,
                ),
              ),
              Text(
                'Top Up E-Wallet Successful!',
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
    );
  }
}
