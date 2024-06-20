import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jala_test/core/service_constants.dart';
import 'package:jala_test/data/model/shrimp_news_model.dart';

class ShrimpNewsService {
  static final ShrimpNewsService _instance = ShrimpNewsService._init();

  static ShrimpNewsService get instance => _instance;

  ShrimpNewsService._init();

  final _constants = ServiceConstants.instance;

  Future<ShrimpNewsModel> fetchTodos(
      [int page = 1, String regionId = "", String sizeFilter = ""]) async {
    var url = Uri.parse(
        "${_constants.baseUrl}${_constants.shrimpNews}?${_constants.perPage}=15&${_constants.page}=$page&${_constants.withParamShrimpNews}");
    debugPrint('url: $url');

    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return ShrimpNewsModel.fromJson(body);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
