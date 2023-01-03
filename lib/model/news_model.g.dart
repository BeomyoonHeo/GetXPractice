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
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'content': instance.content,
    };
