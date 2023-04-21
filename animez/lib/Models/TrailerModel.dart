class TrailerModel {
  final String vidId;
  TrailerModel({required this.vidId});
  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      vidId: json['vidId'],
    );
  }
}
