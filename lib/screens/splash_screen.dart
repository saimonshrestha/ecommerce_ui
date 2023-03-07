import 'package:ecommerce_ui/screens/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    loadPage();
  }
  void loadPage(){
    Future.delayed(const Duration(seconds: 5),(){ 
        Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => const OnBoarding()
            )
        );
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network( 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png'),
          )
        ],
      ),
    );
  }
}