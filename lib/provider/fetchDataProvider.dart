import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../network/model/post.dart';


class fetchDataProvider extends ChangeNotifier {

  List<post> _posts = [];

  List<post> get posts => _posts;

  Future<void> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _posts = responseData.map((postJson) => post.fromJson(postJson)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
