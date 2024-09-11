import 'package:dartz/dartz.dart';

import '../data_model/media_model/media_model.dart';
import '../service/base_service.dart';
import '../service/search_service.dart';

class SearchMediaRepository {
  final BaseService _mediaService = SearchService();

  Future<Either<String, SearchResultModel>> fetchMediaList(String value) async {
    try {
      dynamic response = await _mediaService.getResponse(value);
      final jsonData = response;
      SearchResultModel mediaList = SearchResultModel.fromJson(jsonData);
      return Right(mediaList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
