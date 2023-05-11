
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/post.dart';

Future<List<post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {

   // print(json.decode(response.body));

    final List data = json.decode(response.body);

    final List<post> result = data.map((e) => post.fromJson(e)).toList();

    return result;

  } else {
    throw Exception('Failed to load posts');
  }
}