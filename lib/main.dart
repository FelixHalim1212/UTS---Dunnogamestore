import 'package:dunnostore/Provider/LoginRegisProvider.dart';
import 'package:dunnostore/Provider/Transaksiprovider.dart';
import 'package:dunnostore/Provider/UsersProviders.dart';
import 'package:dunnostore/Views/ScreenLogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserLoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: ColorConstants.primaryColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
