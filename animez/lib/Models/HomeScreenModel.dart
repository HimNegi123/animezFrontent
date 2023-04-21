import 'dart:convert';
import 'package:flutter/material.dart';
class HomeScreenModel{
  final String title;
   final String  animeUrl;
  final String imgUrl;

  const HomeScreenModel({required this.title,required this.animeUrl,required this.imgUrl});
  
  factory HomeScreenModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenModel(
      title: json['title'],
      animeUrl: json['animeUrl'],
      imgUrl: json['imgUrl'],
    );
  }
}
