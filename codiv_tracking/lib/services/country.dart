import 'dart:convert';

import 'package:codiv_tracking/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:codiv_tracking/models/country.dart';

class CountryService {
  final countryName = 'brazil';

  Future<CountryModel> getCountryData() async {
    final response = await http.get('$SERVER_URL/$countryName');

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return CountryModel.fromJson(responseJson['data']);
  }
}
