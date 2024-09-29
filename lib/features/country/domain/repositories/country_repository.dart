import '../entities/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAllCountries();
  Future<Country> getCountryDetail(String cca3);
}
