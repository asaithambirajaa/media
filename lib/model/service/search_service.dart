import 'dart:convert';
import 'dart:io';

import 'package:media_app/model/service/base_service.dart';
import 'package:media_app/model/service/http_client.dart';

import '../app_exception.dart';

class SearchService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await SSLPinning.makeRequest(mediaBaseUrl + url);
      responseJson = await _parseResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> _parseResponse(HttpClientResponse response) async {
    final responseBody = await response.transform(utf8.decoder).join();
    switch (response.statusCode) {
      case 200:
        return jsonDecode(responseBody);
      case 400:
        throw BadRequestException(responseBody.toString());
      case 401:
      case 403:
        throw UnauthorisedException(responseBody.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
