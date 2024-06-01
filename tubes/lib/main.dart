import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tubes/bloc/register/register_cubic.dart';
import 'package:tubes/firebase_options.dart';
import 'package:tubes/splashscreen.dart';
import 'package:tubes/utils/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tubes/bloc/login/login_cubic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit())
        ],
        child: MaterialApp(
          title: 'HeartGuard',
          debugShowCheckedModeBanner: false,
          navigatorKey: NAV_KEY,
          onGenerateRoute: generateRoute,
          home: SplashScreen(),
        ));
  }
}
