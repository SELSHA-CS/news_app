import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/constants/images.dart';
import 'package:news_app/controller/homeController.dart';
import 'package:news_app/controller/themeController.dart';
import 'package:news_app/views/widgets/newsCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  void fetchData(BuildContext context) {
    Provider.of<HomeController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    var themeCntrlr = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width, 70
        ),
        child: AppBar(
          backgroundColor: prColor,
          centerTitle: true,
          title: Text("News Today 🗞️"),
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: prColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: prColor,
                ),
                  child: Image.asset(dImg),
              ),
            ),
            ListTile(
              title: Text("Favorites"),
              leading: FaIcon(FontAwesomeIcons.solidHeart),
              onTap: (){},
            ),
            ListTile(
              title: Text("Dark Mode"),
              leading: FaIcon(FontAwesomeIcons.solidLightbulb),
              trailing: IconButton(
                  onPressed: (){
                    themeCntrlr.switchTheme();
                  },
                  icon: Icon(themeCntrlr.darkTheme ? Icons.dark_mode : Icons.sunny)
              ),
              onTap: (){},
            ),
            ListTile(
              title: Text("About Us"),
              leading: FaIcon(FontAwesomeIcons.circleInfo),
              onTap: (){},
            ),
            ListTile(
              title: Text("Privacy Policy"),
              leading: FaIcon(FontAwesomeIcons.shieldHalved),
              onTap: (){},
            ),
            ListTile(
              title: Text("Terms and Conditions"),
              leading: FaIcon(FontAwesomeIcons.pen),
              onTap: (){},
            ),
            ListTile(
              title: Text("Settings"),
              leading: FaIcon(FontAwesomeIcons.gear),
              onTap: (){},
            )
          ],
        ),
      ),
      body: Consumer<HomeController>(builder: (context, provider, child) {
        return provider.isLoading == true 
        ? Center(
            child: CircularProgressIndicator(
              color: prColor,
            ))
        : Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: provider.newsModel.articles?.length ?? 0,
              itemBuilder: (context, index) => NewsCard(
                title: provider.newsModel.articles?[index].title.toString() ?? "",
                description: provider.newsModel.articles?[index].description.toString() ?? "",
                date: provider.newsModel.articles?[index].publishedAt,
                img: provider.newsModel.articles?[index].urlToImage.toString() ?? "",
                content: provider.newsModel.articles?[index].content.toString() ?? "",
                sourceName: provider.newsModel.articles?[index].source?.name.toString() ?? "",
                url: provider.newsModel.articles?[index].url.toString() ?? "",
              )
            )
          );
      }
    )
    );
  }
}