import 'package:dicoding_country/features/country/domain/entities/country.dart';

abstract class CountryDetailState {}

class CountryDetailInitial extends CountryDetailState {}

class CountryDetailLoading extends CountryDetailState {}

class CountryDetailLoaded extends CountryDetailState {
  final Country country;
  CountryDetailLoaded(this.country);
}

class CountryDetailError extends CountryDetailState {
  final String message;
  CountryDetailError(this.message);
}
