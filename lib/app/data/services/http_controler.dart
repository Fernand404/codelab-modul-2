import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tes/app/data/models/article.dart';

class HttpController extends GetxController {
  static const String _baseUrl = 'https://my-json-server.typicode.com/Fallid/codelab-api/db';

  RxList<Article> articles = RxList<Article>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(_baseUrl)); // Remove API key

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final articlesResult = Welcome.fromJson(jsonData); // Ensure 'Welcome' is your model
        articles.value = articlesResult.articles; // Access list of articles from 'Welcome'
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }



}