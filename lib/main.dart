import 'package:dicoding_country/core/configs/config.dart';
import 'package:dicoding_country/core/routes/route_generate.dart';
import 'package:dicoding_country/core/routes/route_name.dart';
import 'package:dicoding_country/features/country/domain/repositories/country_repository.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country_detail/country_detail_event.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country/country_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'features/country/data/datasources/country_remote_datasource.dart';
import 'features/country/data/repositories/country_repository_impl.dart';
import 'features/country/presentation/bloc/country/country_bloc.dart';
import 'features/country/presentation/bloc/country_detail/country_detail_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.easyLoading();

  final CountryRemoteDataSource remoteDataSource =
      CountryRemoteDataSourceImpl(http.Client());
  final countryRepository = CountryRepositoryImpl(remoteDataSource);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CountryRepository>(
          create: (context) => countryRepository,
        ),
        // Add more RepositoryProviders here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String initial = RouteName.INITIAL;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CountryBloc(context.read<CountryRepository>())
              ..add(FetchCountries()),
          ),
          BlocProvider(
            create: (context) =>
                CountryDetailBloc(context.read<CountryRepository>())
                  ..add(FetchCountryDetail("IDN")),
          ),
          // Add more BlocProviders here if needed
        ],
        child: MaterialApp(
          title: const String.fromEnvironment("APP_NAME"),
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            bottomSheetTheme: const BottomSheetThemeData(
              surfaceTintColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          initialRoute: initial,
          onGenerateRoute: RouteGenerate.onRoute,
        ),
      );
    });
  }
}
