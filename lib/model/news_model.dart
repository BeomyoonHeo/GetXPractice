import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsList {
  List<News> articles;

  NewsList({required this.articles});

  factory NewsList.fromJson(Map<String, dynamic> json) =>
      _$NewsListFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}

@JsonSerializable()
class News {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? description;
  String? publishedAt;

  News(
      {this.title,
      this.author,
      this.content,
      this.urlToImage,
      this.description,
      this.publishedAt}) {
    // url 이미지 깨졌을때 대체 이미지
    if (urlToImage != null &&
        !(urlToImage!.startsWith('http') || urlToImage!.startsWith('https'))) {
      urlToImage = 'https://picsum.photos/id/421/200/200';
    }
  }

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
