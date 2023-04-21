import 'dart:convert';

import 'package:animez/Models/HomeScreenModel.dart';
import 'package:animez/Models/SearchScreenModel.dart';
import 'package:animez/Models/TrailerModel.dart';
import 'package:animez/Models/WatchAnimeUrlModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Models/AnimeScreenModel.dart';

class ApiDataCalling{
  final String baseUrl='https://da7a-2405-201-6805-3843-50d6-da6b-a4a0-bb58.ngrok-free.app';
Future<List<List<HomeScreenModel>>> fechModel() async {
  final response= await Future.wait(
    [
 http.get(Uri.parse('$baseUrl/home1')),
  http.get(Uri.parse('$baseUrl/home2')),
   http.get(Uri.parse('$baseUrl/home3')),
    ]
  );
  if (response[0].statusCode == 200 && response[1].statusCode == 200 && response[2].statusCode == 200 ) {
    List<dynamic> data1= jsonDecode(response[0].body);
 List<dynamic> data2= jsonDecode(response[1].body);
  List<dynamic> data3= jsonDecode(response[2].body);
    List<HomeScreenModel> animeList1 = [];
     List<HomeScreenModel> animeList2 = [];
      List<HomeScreenModel> animeList3 = [];
    for (var item in data1) {
      HomeScreenModel anime = HomeScreenModel.fromJson(item);
      animeList1.add(anime);
    }
     for (var item in data2) {
      HomeScreenModel anime = HomeScreenModel.fromJson(item);
      animeList2.add(anime);
    }
     for (var item in data3) {
      HomeScreenModel anime = HomeScreenModel.fromJson(item);
      animeList3.add(anime);
    }
    return [animeList1,animeList2,animeList3];
  } else {
    throw Exception('Failed to load anime list');
  }
}

//search

Future<List<SearchScreenModel>> searchApi(String data) async{
  final response=await http.get(Uri.parse('$baseUrl/search?name=$data'));
  if(response.statusCode==200){
    List<dynamic> data=jsonDecode(response.body);
    List<SearchScreenModel> animeList=[];
      for (var item in data) {
      SearchScreenModel anime = SearchScreenModel.fromJson(item);
      animeList.add(anime);
    }
    return animeList;

  }
  else {
    throw Exception('Failed to load anime list');
  }
}

Future<AnimeScreenModel> animeApi(String data) async {
  final url = Uri.parse('$baseUrl/anime');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'animeUrl': data});
  
  final response = await http.post(url, headers: headers, body: body);
  
  if (response.statusCode == 200) {
    print(response.body);
    return AnimeScreenModel.fromJson(json.decode(response.body));
  } else {
    // Request failed
    throw Exception('Failed to load anime data');
  }
}
Future<TrailerModel> getTrailer(String data) async{
  print(data);
  final url=Uri.parse('$baseUrl/trailer?vidid=$data');
  final response=await http.get(url);
  if(response.statusCode==200){
  final createData=TrailerModel.fromJson(jsonDecode(response.body));
  return createData;
  }
  else{
    throw Exception('faied to get id');
  }
}
Future<WatchAnimeUrlModel> getEpUrl(String data) async{
  final url=Uri.parse('$baseUrl/watch');
   final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'url': data,});
  final response = await http.post(url, headers: headers, body: body);
  if(response.statusCode==200){
    print(response.body);
    final dataUrl=WatchAnimeUrlModel.fromJson(jsonDecode(response.body));
  
    return dataUrl;
  }
  else{
    throw Exception('failed to load anime');
  }
}
}
    