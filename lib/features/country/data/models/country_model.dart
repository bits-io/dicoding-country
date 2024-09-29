import '../../domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({
    required Name name,
    required List<String> tld,
    required String cca2,
    required String? ccn3,
    required String cca3,
    required String? cioc,
    required bool? independent,
    required String status,
    required bool unMember,
    required Currencies currencies,
    required Idd idd,
    required List<String>? capital,
    required List<String> altSpellings,
    required String region,
    required String subregion,
    required Languages languages,
    required Map<String, Translation> translations,
    required List<double> latlng,
    required bool landlocked,
    required List<String>? borders,
    required double area,
    required Demonyms demonyms,
    required String flag,
    required Maps maps,
    required double population,
    required String? fifa,
    required Car car,
    required List<String> timezones,
    required List<String> continents,
    required Flags flags,
    required CoatOfArms coatOfArms,
    required String startOfWeek,
    required CapitalInfo capitalInfo,
    required PostalCode postalCode,
  }) : super(
          name: name,
          tld: tld,
          cca2: cca2,
          ccn3: ccn3 ?? '',
          cca3: cca3,
          cioc: cioc ?? '',
          independent: independent ?? false,
          status: status,
          unMember: unMember,
          currencies: currencies,
          idd: idd,
          capital: capital ?? [],
          altSpellings: altSpellings,
          region: region,
          subregion: subregion,
          languages: languages,
          translations: translations,
          latlng: latlng,
          landlocked: landlocked,
          borders: borders ?? [],
          area: area,
          demonyms: demonyms,
          flag: flag,
          maps: maps,
          population: population,
          fifa: fifa ?? '',
          car: car,
          timezones: timezones,
          continents: continents,
          flags: flags,
          coatOfArms: coatOfArms,
          startOfWeek: startOfWeek,
          capitalInfo: capitalInfo,
          postalCode: postalCode,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: Name(
        common: json['name']['common'] ?? '',
        official: json['name']['official'] ?? '',
        nativeName: NativeName(
          ind: Translation(
            official: json['name']['nativeName']?['ind']?['official'] ?? '',
            common: json['name']['nativeName']?['ind']?['common'] ?? '',
          ),
        ),
      ),
      tld: List<String>.from(json['tld'] ?? []),
      cca2: json['cca2'] ?? '',
      ccn3: json['ccn3'],
      cca3: json['cca3'] ?? '',
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'] ?? '',
      unMember: json['unMember'] ?? false,
      currencies: Currencies(
        idr: Idr(
          name: json['currencies']?['IDR']?['name'] ?? '',
          symbol: json['currencies']?['IDR']?['symbol'] ?? '',
        ),
      ),
      idd: Idd(
        root: json['idd']?['root'] ?? '',
        suffixes: List<String>.from(json['idd']?['suffixes'] ?? []),
      ),
      capital:
          json['capital'] != null ? List<String>.from(json['capital']) : [],
      altSpellings: List<String>.from(json['altSpellings'] ?? []),
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      languages: Languages(
        ind: json['languages']?['ind'] ?? '',
      ),
      translations: (json['translations'] as Map<String, dynamic>? ?? {}).map(
        (key, value) => MapEntry(
          key,
          Translation(
            official: value['official'] ?? '',
            common: value['common'] ?? '',
          ),
        ),
      ),
      latlng: (json['latlng'] as List<dynamic>?)
              ?.where((element) => element != null)
              .map((element) => element as double)
              .toList() ??
          [],
      landlocked: json['landlocked'] ?? false,
      borders:
          json['borders'] != null ? List<String>.from(json['borders']) : [],
      area: json['area'] ?? 0,
      demonyms: Demonyms(
        eng: Eng(
          f: json['demonyms']?['eng']?['f'] ?? '',
          m: json['demonyms']?['eng']?['m'] ?? '',
        ),
        fra: Eng(
          f: json['demonyms']?['fra']?['f'] ?? '',
          m: json['demonyms']?['fra']?['m'] ?? '',
        ),
      ),
      flag: json['flag'] ?? '',
      maps: Maps(
        googleMaps: json['maps']?['googleMaps'] ?? '',
        openStreetMaps: json['maps']?['openStreetMaps'] ?? '',
      ),
      population: json['population'] ?? 0,
      fifa: json['fifa'],
      car: Car(
        signs: List<String>.from(json['car']?['signs'] ?? []),
        side: json['car']?['side'] ?? '',
      ),
      timezones: List<String>.from(json['timezones'] ?? []),
      continents: List<String>.from(json['continents'] ?? []),
      flags: Flags(
        png: json['flags']?['png'] ?? '',
        svg: json['flags']?['svg'] ?? '',
        alt: json['flags']?['alt'] ?? '',
      ),
      coatOfArms: CoatOfArms(
        png: json['coatOfArms']?['png'] ?? '',
        svg: json['coatOfArms']?['svg'] ?? '',
      ),
      startOfWeek: json['startOfWeek'] ?? '',
      capitalInfo: CapitalInfo(
        latlng: (json['capitalInfo']?['latlng'] as List<dynamic>?)
                ?.where((element) => element != null)
                .map((element) => element as double)
                .toList() ??
            [],
      ),
      postalCode: PostalCode(
        format: json['postalCode']?['format'] ?? '',
        regex: json['postalCode']?['regex'] ?? '',
      ),
    );
  }
}
