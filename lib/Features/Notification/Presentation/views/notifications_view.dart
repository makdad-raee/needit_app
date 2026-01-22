import 'package:flutter/material.dart';
import 'package:needit_app/Features/Notification/Presentation/views/widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.more_horiz_rounded),
          SizedBox(width: 20),
          SizedBox(width: 8),
        ],
      ),
      body: const SafeArea(child: NotificationsViewBody()),
    );
  }
}
