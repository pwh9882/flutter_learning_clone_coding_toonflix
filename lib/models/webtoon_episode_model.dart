class WebtoonEpisodModel {
  final String thumbnail, id, title, rating, date;

  WebtoonEpisodModel.fromJson(Map<String, dynamic> json)
      : thumbnail = json['thumb'],
        id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
