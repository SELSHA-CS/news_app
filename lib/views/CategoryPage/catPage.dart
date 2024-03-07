import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/controller/catController.dart';
import 'package:news_app/views/widgets/newsCard.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {

  void fetchData(BuildContext context) async {
    Provider.of<CatController>(context, listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CatController>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: prColor,
              centerTitle: true,
              title: Text("Categories"),
              bottom: TabBar(
                labelColor: bgColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: scColor,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                tabs: List.generate(provider.categoryList.length,
                      (index) => Tab(
                    text: provider.categoryList[index],
                  ),
                ),
                onTap: (value) {
                  provider.onTap(index: value);
                },
              ),
            ),
            body: provider.isLoading == true ? Center(
                child: CircularProgressIndicator(
                  color: prColor,
                ))
                : Padding(padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                    title: provider.newsModel.articles?[index].title.toString()
                        ?? "",
                    description: provider.newsModel.articles?[index].description
                        .toString() ?? "",
                    date: provider.newsModel.articles?[index].publishedAt,
                    img: provider.newsModel.articles?[index].urlToImage
                        .toString() ?? "",
                    content: provider.newsModel.articles?[index].content
                        .toString() ?? "",
                    sourceName: provider.newsModel.articles?[index].source?.name
                        .toString() ??
                        "",
                    url: provider.newsModel.articles?[index].url
                        .toString() ??
                        "",
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 20,
                  ),
                  itemCount: provider.newsModel.articles?.length ?? 0),
            ),
          ),
        );
      },
    );
  }
}