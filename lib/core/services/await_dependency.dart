import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/core/NetworkApI/dio_helper.dart';
import 'package:needit_app/core/utlis/simple_bloc_observer.dart';
import 'package:needit_app/firebase_options.dart';
import 'package:needit_app/injection_container.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> awaitDependency() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  DioHelper.init();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
