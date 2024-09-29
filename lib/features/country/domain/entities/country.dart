import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final Name name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Currencies currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Languages languages;
  final Map<String, Translation> translations;
  final List<double> latlng;
  final bool landlocked;
  final List<String> borders;
  final double area;
  final Demonyms demonyms;
  final String flag;
  final Maps maps;
  final double population;
  final String fifa;
  final Car car;
  final List<String> timezones;
  final List<String> continents;
  final Flags flags;
  final CoatOfArms coatOfArms;
  final String startOfWeek;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  Country({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.borders,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  @override
  List<Object?> get props => [
        name,
        tld,
        cca2,
        ccn3,
        cca3,
        cioc,
        independent,
        status,
        unMember,
        currencies,
        idd,
        capital,
        altSpellings,
        region,
        subregion,
        languages,
        translations,
        latlng,
        landlocked,
        borders,
        area,
        demonyms,
        flag,
        maps,
        population,
        fifa,
        car,
        timezones,
        continents,
        flags,
        coatOfArms,
        startOfWeek,
        capitalInfo,
        postalCode,
      ];
}

class CapitalInfo {
  List<double> latlng;

  CapitalInfo({
    required this.latlng,
  });
}

class Car {
  List<String> signs;
  String side;

  Car({
    required this.signs,
    required this.side,
  });
}

class CoatOfArms {
  String png;
  String svg;

  CoatOfArms({
    required this.png,
    required this.svg,
  });
}

class Currencies {
  Idr idr;

  Currencies({
    required this.idr,
  });
}

class Idr {
  String name;
  String symbol;

  Idr({
    required this.name,
    required this.symbol,
  });
}

class Demonyms {
  Eng eng;
  Eng fra;

  Demonyms({
    required this.eng,
    required this.fra,
  });
}

class Eng {
  String f;
  String m;

  Eng({
    required this.f,
    required this.m,
  });
}

class Flags {
  String png;
  String svg;
  String alt;

  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });
}

class Idd {
  String root;
  List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });
}

class Languages {
  String ind;

  Languages({
    required this.ind,
  });
}

class Maps {
  String googleMaps;
  String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });
}

class Name {
  String common;
  String official;
  NativeName nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });
}

class NativeName {
  Translation ind;

  NativeName({
    required this.ind,
  });
}

class Translation {
  String official;
  String common;

  Translation({
    required this.official,
    required this.common,
  });
}

class PostalCode {
  String format;
  String regex;

  PostalCode({
    required this.format,
    required this.regex,
  });
}
