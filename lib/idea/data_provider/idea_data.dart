import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter_network/idea/models/idea.dart';
import 'package:http/http.dart' as http;

class IdeaDataProvider {
  final http.Client httpClient;
  final String baseUrl = 'http://localhost:3000';
  IdeaDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Idea> createIdea(Idea idea) async {
    final response = await http.post(
      Uri.https('localhost:3000','/ideas'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8' ,
      },
      body: jsonEncode(<String, dynamic>{
        'title': idea.title,
        'description': idea.description,
        'image':idea.image
      }),
    );

    if (response.statusCode == 200) {
      print('posting from flutter app');
      return Idea.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create idea.');
    }

  }

  Future<List<Idea>> getIdeas() async {
    final response = await httpClient.get("localhost:3000/ideas");

    if (response.statusCode == 200) {
      print("connected with api");
      final ideas = jsonDecode(response.body) as List;
      return ideas.map((idea) => Idea.fromJson(idea)).toList();
    } else {
      throw Exception('Failed to load ideas');
    }
  }

  Future<void> deleteIdea(String id) async {
    final http.Response response = await httpClient.delete(
      'localhost:3000/ideas/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateIdea(Idea idea) async {
    final http.Response response = await httpClient.put(
      'localhost:3000/ideas/${idea.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': idea.id,
        'title': idea.title,
        'description': idea.description,
        'image':idea.image
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update idea.');
    }
  }
}
