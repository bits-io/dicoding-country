import 'package:dicoding_country/features/country/presentation/widgets/like_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country/country_bloc.dart';
import '../bloc/country/country_state.dart';
import 'country_detail_page.dart';

class CountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries')),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailPage(cca3: country.cca3),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Container(
                        width: 70,
                        height: 50,
                        child:
                            Image.network(country.flags.png, fit: BoxFit.cover),
                      ),
                      title: Text(
                        country.name.common,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      subtitle: Text(
                        '${country.capital.join(', ')}, ${country.region}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      trailing: LikeButton(),
                    ),
                  ),
                );
              },
            );
          } else if (state is CountryError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No data'));
        },
      ),
    );
  }
}
