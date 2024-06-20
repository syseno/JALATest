import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:jala_test/core/service_constants.dart';
import 'package:jala_test/data/model/shrimp_price_model.dart';

class ShrimpPriceService {
  static final ShrimpPriceService _instance = ShrimpPriceService._init();

  static ShrimpPriceService get instance => _instance;

  ShrimpPriceService._init();

  final _constants = ServiceConstants.instance;

  Future<ShrimpPriceModel> fetchTodos(
      [int page = 1, String regionId = "", String sizeFilter = ""]) async {
    var url = Uri.parse("${_constants.baseUrl}${_constants.shrimpPrices}?${_constants.perPage}=15&${_constants.page}=$page&${_constants.withParamShrimpPrice}&${_constants.regionId}=$regionId");
    debugPrint('url: $url');

    final response = await http.get(url, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return ShrimpPriceModel.fromJson(body);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
