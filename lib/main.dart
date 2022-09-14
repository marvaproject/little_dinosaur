import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:little_dinosaur/Page/home_page.dart';
import 'package:little_dinosaur/Page/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: isviewed != 0 ? const OnBoard() :  HomePage(userame: '',),
      backgroundColor: const Color.fromARGB(255, 237, 249, 255),
      splashIconSize: 250,
      duration: 2000,
      splash: Container(
        margin: const EdgeInsets.symmetric(horizontal: 70),
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage('assets/image/dino_icon/logodino.png'),
        ),
      ),
    );
  }
}