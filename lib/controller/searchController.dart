import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsModel.dart';

class SearchsController extends ChangeNotifier{
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async{
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=b3c465623333441cbf1f111d11e2b172");
    try{
      final response = await http.get(
        url,
        headers: {
          'Content-Type': "application/json",
        }
      );
      print(response.statusCode);

      if(response.statusCode == 200){
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      }
      else{
        print("Api failed");
      }
    }
    catch(e){
      print("Error: $e");
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
}