class WebtoonDetailModel {
  final String title, about, genre, age, thumbnail;
  WebtoonDetailModel.fromJson(Map<String, dynamic> details)
      : title = details['title'],
        about = details['about'],
        genre = details['genre'],
        age = details['age'],
        thumbnail = details['thumb'];
}
