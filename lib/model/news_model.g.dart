// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsList _$NewsListFromJson(Map<String, dynamic> json) => NewsList(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'articles': instance.articles,
    };

News _$NewsFromJson(Map<String, dynamic> json) => News(
      title: json['title'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      urlToImage: json['urlToImage'] as String?,
      description: json['description'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      bookMark: json['bookMark'] as bool?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'content': instance.content,
      'urlToImage': instance.urlToImage,
      'description': instance.description,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'bookMark': instance.bookMark,
      'index': instance.index,
    };
