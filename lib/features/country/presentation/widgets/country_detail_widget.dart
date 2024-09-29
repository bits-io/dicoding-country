import 'package:dicoding_country/features/country/domain/entities/country.dart';
import 'package:flutter/material.dart';

class CountryDetailWidget extends StatelessWidget {
  final Country country;

  CountryDetailWidget({required this.country});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Image.network(
                  country.flags.png,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(4),
                  child: Text(
                    country.name.common,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildInfoCard(
                    Icons.flag, 'Official Name', country.name.official),
                _buildInfoCard(
                    Icons.location_city, 'Capital', country.capital.join(', ')),
                _buildInfoCard(Icons.public, 'Region', country.region),
                _buildInfoCard(Icons.map, 'Subregion', country.subregion),
                _buildInfoCard(
                    Icons.people, 'Population', country.population.toString()),
                _buildInfoCard(Icons.attach_money, 'Currency',
                    '${country.currencies.idr.name} (${country.currencies.idr.symbol})'),
                _buildInfoCard(
                    Icons.language, 'Languages', country.languages.ind),
                _buildInfoCard(
                    Icons.border_all, 'Borders', country.borders.join(', ')),
                _buildInfoCard(Icons.landscape, 'Area', '${country.area} km²'),
                _buildInfoCard(Icons.access_time, 'Timezone',
                    country.timezones.join(', ')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                  'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                  'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
                  'deserunt mollit anim id est laborum.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(value),
          ],
        ),
      ),
    );
  }
}
