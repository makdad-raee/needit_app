import 'package:flutter/material.dart';
import 'package:needit_app/Features/Notification/Presentation/views/notifications_view.dart';
import 'package:needit_app/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 24),
        Text(
          'Syria-Aleppo',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12,
            fontFamily: kSwiss721Bold,
          ),
        ),
        const Icon(Icons.arrow_drop_down),
        const Spacer(),
        // GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => const ProfileView(),
        //       ));
        //     },
        //     child: const Icon(Icons.person_2_outlined)),
        // const SizedBox(
        //   width: 11,
        // ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationsView(),
              ),
            );
          },
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsView(),
                ),
              );
            },
            child: Container(
              height: 40,
              width: 42,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.notifications_none, size: 22),
            ),
          ),
        ),
      ],
    );
  }
}
