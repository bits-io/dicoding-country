import 'package:dicoding_country/features/country/data/repositories/country_repository_impl.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country/country_bloc.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country_detail/country_detail_bloc.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country_detail/country_detail_event.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country/country_event.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_country/features/country/presentation/pages/country_page.dart';
import 'package:dicoding_country/features/country/presentation/pages/country_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'route_name.dart';

class RouteGenerate {
  static Route<dynamic> onRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.INITIAL:
        return MaterialPageRoute(builder: (_) => CountryPage());
      case RouteName.COUNTRY_DETAIL:
        final cca3 = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CountryDetailPage(cca3: cca3));
      default:
        return MaterialPageRoute(builder: (_) => CountryPage());
    }
  }

  static List<BlocProvider> pageProvider(BuildContext context) {
    return [
      BlocProvider(
        create: (context) => CountryBloc(context.read<CountryRepositoryImpl>())
          ..add(FetchCountries()),
      ),
      BlocProvider(
        create: (context) =>
            CountryDetailBloc(context.read<CountryRepositoryImpl>())
              ..add(FetchCountryDetail("IDN")),
      ),
    ];
  }
}
