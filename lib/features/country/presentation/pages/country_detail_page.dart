import 'package:dicoding_country/features/country/domain/repositories/country_repository.dart';
import 'package:dicoding_country/features/country/presentation/widgets/like_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country_detail/country_detail_bloc.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country_detail/country_detail_event.dart';
import 'package:dicoding_country/features/country/presentation/bloc/country_detail/country_detail_state.dart';
import 'package:dicoding_country/features/country/presentation/widgets/country_detail_widget.dart';

class CountryDetailPage extends StatelessWidget {
  final String cca3;

  const CountryDetailPage({Key? key, required this.cca3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Detail'),
      ),
      body: BlocProvider(
        create: (context) => CountryDetailBloc(
          context.read<CountryRepository>(),
        )..add(FetchCountryDetail(cca3)),
        child: BlocBuilder<CountryDetailBloc, CountryDetailState>(
          builder: (context, state) {
            if (state is CountryDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CountryDetailLoaded) {
              return CountryDetailWidget(country: state.country);
            } else if (state is CountryDetailError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: LikeButton(),
    );
  }
}
