import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jala_test/core/service_constants.dart';
import 'package:jala_test/data/model/shrimp_ill_model.dart';

class ShrimpIllService {
  static final ShrimpIllService _instance = ShrimpIllService._init();

  static ShrimpIllService get instance => _instance;

  ShrimpIllService._init();

  final _constants = ServiceConstants.instance;

  Future<ShrimpIllModel> fetchTodos(
      [int page = 1, String regionId = "", String sizeFilter = ""]) async {
    var url = Uri.parse(
        "${_constants.baseUrl}${_constants.shrimpIll}?${_constants.perPage}=15&${_constants.page}=$page");
    debugPrint('url: $url');

    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "${_constants.bearer} ${_constants.token}"
    });
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return ShrimpIllModel.fromJson(body);
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
