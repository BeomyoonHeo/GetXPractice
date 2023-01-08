import 'package:dio/dio.dart';
import 'package:getx_practice/model/news_model.dart';
import 'package:retrofit/http.dart';

part 'news_repository.g.dart';

const apiKey =
    'https://newsapi.org/v2/top-headlines?country=kr&apiKey=12b9be8485454b3e913575a3560b9101';

//remote data
@RestApi(baseUrl: apiKey)
abstract class NewsRemoteRepository {
  factory NewsRemoteRepository(Dio dio) = _NewsRemoteRepository;

  @GET('')
  Future<NewsList> getNews();
}
