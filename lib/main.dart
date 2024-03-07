import 'package:flutter/material.dart';
import 'package:news_app/controller/barController.dart';
import 'package:news_app/controller/catController.dart';
import 'package:news_app/controller/homeController.dart';
import 'package:news_app/controller/searchController.dart';
import 'package:news_app/controller/themeController.dart';
import 'package:news_app/views/SplashScreen/spalshScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BarController()),
          ChangeNotifierProvider(create: (context) => HomeController()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => CatController()),
          ChangeNotifierProvider(create: (context) => SearchsController())
        ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => BarController()),
    //     ChangeNotifierProvider(create: (context) => HomeController()),
    //     ChangeNotifierProvider(create: (context) => ThemeProvider()),
    //   ],
    //  child:
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
        home: SplashScreen(),
      );
    //);
  }
}