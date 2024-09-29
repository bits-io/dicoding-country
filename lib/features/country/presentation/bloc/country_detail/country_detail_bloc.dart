import 'package:dicoding_country/features/country/domain/repositories/country_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'country_detail_event.dart';
import 'country_detail_state.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState> {
  final CountryRepository repository;

  CountryDetailBloc(this.repository) : super(CountryDetailInitial()) {
    on<FetchCountryDetail>(_onFetchCountryDetail);
  }

  void _onFetchCountryDetail(
      FetchCountryDetail event, Emitter<CountryDetailState> emit) async {
    emit(CountryDetailLoading());
    try {
      final country = await repository.getCountryDetail(event.cca3);
      emit(CountryDetailLoaded(country));
    } catch (e) {
      emit(CountryDetailError(e.toString()));
    }
  }
}
