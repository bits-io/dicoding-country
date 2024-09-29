abstract class CountryDetailEvent {}

class FetchCountryDetail extends CountryDetailEvent {
  final String cca3;
  FetchCountryDetail(this.cca3);
}
