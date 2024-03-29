import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/controller/homeController.dart';
import 'package:news_app/views/widgets/newsDetails.dart';
import 'package:provider/provider.dart';

class NewsCard extends StatelessWidget {

  final String title;
  final String description;
  final DateTime? date;
  final String img;
  final String content;
  final String sourceName;
  final String url;

  NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.img,
    required this.content,
    required this.sourceName,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: scColor,
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    img,
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewsDet(
                    title: title,
                    description: description,
                    img: img,
                    date: date,
                    content: content,
                    sourceName: sourceName,
                    url: url
                  ))
                );
              },
              child: Column(
                children: [
                  Text(title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ""}"),
                      //IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                      IconButton(
                        onPressed: () {
                          String newsToShare = "$title \n \n $description \n \n $url";
                          Provider.of<HomeController>(context, listen: false).shareText(textToShare: newsToShare);
                        },
                        icon: const Icon(Icons.share, color: scColor,)
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}