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

  News({this.title, this.author, this.content});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
