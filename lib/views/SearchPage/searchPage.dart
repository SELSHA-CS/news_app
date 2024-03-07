import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/controller/searchController.dart';
import 'package:news_app/views/widgets/newsCard.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController searchCntrl = TextEditingController();
    SearchsController provider = Provider.of<SearchsController>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 2/3,
                    child: TextField(
                      controller: searchCntrl,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        provider.searchData(searchText: searchCntrl.text.toLowerCase());
                        FocusManager.instance.primaryFocus?.unfocus();
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: prColor
                      ),
                      child: Text("search")
                    )
                  )
                ],
              ),
              Expanded(
                child: Provider.of<SearchsController>(context).isLoading == true 
                ? Center(
                  child: CircularProgressIndicator(
                    color: prColor,
                  ),
                )
                : ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                    title: provider.newsModel?.articles?[index].title ?? "", 
                    description: provider.newsModel?.articles?[index].description ?? "", 
                    date: provider.newsModel?.articles?[index].publishedAt, 
                    img: provider.newsModel?.articles?[index].urlToImage ?? "", 
                    content: provider.newsModel?.articles?[index].content ?? "", 
                    sourceName: provider.newsModel?.articles?[index].source?.name ?? "", 
                    url: provider.newsModel?.articles?[index].url ?? ""
                  ), 
                  separatorBuilder: (context, index) => Divider(height: 20,), 
                  itemCount: provider.newsModel?.articles?.length ?? 0
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}
