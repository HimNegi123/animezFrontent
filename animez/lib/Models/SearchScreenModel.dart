import 'dart:convert';
import 'package:flutter/material.dart';
class SearchScreenModel{
  final String title;
   final String  animeUrl;
  final String imgUrl;

  const SearchScreenModel({required this.title,required this.animeUrl,required this.imgUrl});
  
  factory SearchScreenModel.fromJson(Map<String, dynamic> json) {
    return SearchScreenModel(
      title: json['title'],
      animeUrl: json['animeUrl'],
      imgUrl: json['imgUrl'],
    );
  }}