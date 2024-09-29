import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> getAllCountries();
  Future<Map<String, dynamic>> getCountryDetail(String cca3);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final http.Client client;

  CountryRemoteDataSourceImpl(this.client);

  @override
  Future<List<CountryModel>> getAllCountries() async {
    final response =
        await client.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Future<Map<String, dynamic>> getCountryDetail(String cca3) async {
    final response = await client
        .get(Uri.parse('https://restcountries.com/v3.1/alpha/$cca3'));

    if (response.statusCode == 200) {
      return json.decode(response.body)[0];
    } else {
      throw Exception('Failed to load country detail');
    }
  }
}
