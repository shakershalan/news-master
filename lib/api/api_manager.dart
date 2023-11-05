import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled5/model/newsResponse.dart';

import '../model/SourceResponse.dart';
import 'api_constents.dart';

///https://newsapi.org/v2/everything?q=bitcoin&apiKey=4802923e8a274ae8aed08a8e76767f8a
class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceUrl,
        {"apiKey": "4802923e8a274ae8aed08a8e76767f8a", "category": categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsSourceUrl,
        {"apiKey": "4802923e8a274ae8aed08a8e76767f8a", "sources": sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsSearch(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsSourceUrl,
        {"apiKey": "4802923e8a274ae8aed08a8e76767f8a", "q": query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
