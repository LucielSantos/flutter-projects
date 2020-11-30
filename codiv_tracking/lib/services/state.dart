import 'dart:convert';

import 'package:codiv_tracking/models/state.dart';
import 'package:codiv_tracking/utils/constants.dart';
import 'package:http/http.dart' as http;

class StateService {
  final countryName = 'brazil';

  Future<StateDetailModel> getStateData(slug) async {
    final response = await http.get('$SERVER_URL/$countryName/uf/$slug');

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return StateDetailModel.fromJson(responseJson);
  }
}
