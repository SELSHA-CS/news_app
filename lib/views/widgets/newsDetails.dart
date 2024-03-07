import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/styles.dart';
import 'package:news_app/controller/homeController.dart';
import 'package:news_app/views/BottomNavBar/mainPage.dart';
import 'package:provider/provider.dart';

class NewsDet extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String img;
  final String content;
  final String sourceName;
  final String url;

  NewsDet({
    super.key, 
    required this.title, 
    required this.description, 
    required this.img, 
    this.date, 
    required this.content, 
    required this.sourceName, 
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 300),
        child: AppBar(
          leading: CircleAvatar(
            backgroundColor: scColor,
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainPage())
                );
              }, 
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,
            ))
          ),
          flexibleSpace: Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: t1,),
            Text("$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description, style: t2,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content, style: t2,),
            ),
            InkWell(
              onTap: (){
                Provider.of<HomeController>(context).launchURL(url);
              },
              child: Text("Click Here to read more"),
            )
          ],
        ),
      ),
    );
  }
}
