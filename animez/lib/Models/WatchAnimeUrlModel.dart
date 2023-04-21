class WatchAnimeUrlModel{
final  String url;
  WatchAnimeUrlModel({required this.url});
  factory WatchAnimeUrlModel.fromJson(Map<String,dynamic> json){
    return WatchAnimeUrlModel(url:json['src']); 
  }
}