
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/news.dart';


// https://newsapi.org/v2/everything?q=tesla&from=2023-03-05&sortBy=publishedAt&apiKey=d2288be6d4ab4dfb8b1ded6935018594

Future<List<Articles>> fetchNews() async {

  // final url= 'https://newsapi.org/v2/everything?q=tesla&from=2023-04-20&sortBy=publishedAt&apiKey=d2288be6d4ab4dfb8b1ded6935018594';

  final _url='https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d2288be6d4ab4dfb8b1ded6935018594';

  final url=Uri.parse('https://newsapi.org/v2/everything');
  var queryParameters = {
    'domains': 'wsj.com',
    'apiKey': 'd2288be6d4ab4dfb8b1ded6935018594',
  };

  final response = await http.get(url.replace(queryParameters: queryParameters),);

  if (response.statusCode == 200) {
    
    print(response.body.runtimeType);

    final Map<String,dynamic> data = json.decode(response.body);

    final res = data['articles'] as List<dynamic>;

    final result=res.map((e) => Articles.fromJson(e)).toList();

    print("Successful get new data is ${res.runtimeType}${res} ");

    return result;

  } else {
    throw Exception('Failed to load posts');
  }
}