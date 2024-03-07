import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/images.dart';
import 'package:news_app/views/BottomNavBar/mainPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainPage()
      ));
    });

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(splashI),
        ),
      ),
    );
  }
}

