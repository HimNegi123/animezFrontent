import 'dart:convert';

class AnimeScreenModel {
  final String getImage;
  final String getTitle;
  final String getType;
  final String plotSummary;
  final String getdiffName;
  final List<Episode> episodes;

  AnimeScreenModel({
    required this.getImage,
    required this.getTitle,
    required this.getType,
    required this.plotSummary,
    required this.getdiffName,
    required this.episodes,
  });

  factory AnimeScreenModel.fromJson(Map<String, dynamic> json) {
    List<Episode> episodeList = (jsonDecode(json['episodes']) as List<dynamic>)
        .map((episode) => Episode.fromJson(episode))
        .toList();

    return AnimeScreenModel(
      getImage: json['getImage'],
      getTitle: json['getTitle'],
      getType: json['getType'],
      plotSummary: json['plotSummary'],
      getdiffName: json['getdiffName'],
      episodes: episodeList,
    );
  }
}

class Episode {
  final String url;

  Episode({required this.url});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      url: json['url'],
    );
  }
}
