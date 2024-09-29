import '../../domain/entities/country.dart';
import '../../domain/repositories/country_repository.dart';
import '../datasources/country_remote_datasource.dart';
import '../models/country_detail_model.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;

  CountryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Country>> getAllCountries() async {
    return await remoteDataSource.getAllCountries();
  }

  @override
  Future<Country> getCountryDetail(String cca3) async {
    final countryDetail = await remoteDataSource.getCountryDetail(cca3);
    return CountryDetailModel.fromJson(countryDetail);
  }
}
