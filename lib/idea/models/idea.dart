import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Idea extends Equatable {
  Idea(
      {this.id,
      @required this.title,
      @required this.description,
       this.image});

  final String id;
  final String title;
  final String description;
  final String image;

  @override
  List<Object> get props => [id, title, description,image];

  factory Idea.fromJson(Map<String, dynamic> json) {
    return Idea(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image']
    );
  }

  @override
  String toString() => 'Idea { id: $id, title:$title,description:$description,image:$image, }';
}
