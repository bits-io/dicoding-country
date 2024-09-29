import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/country_repository.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository repository;

  CountryBloc(this.repository) : super(CountryInitial()) {
    on<FetchCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await repository.getAllCountries();
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError(e.toString()));
      }
    });
  }
}
