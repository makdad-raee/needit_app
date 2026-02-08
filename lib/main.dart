import 'package:flutter/material.dart';
import 'package:needit_app/core/services/await_dependency.dart';
import 'package:needit_app/root_app.dart';

void main() async {
  await awaitDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RootApp();
  }
}
