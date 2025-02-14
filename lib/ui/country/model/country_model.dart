// ignore_for_file: public_member_api_docs, sort_constructors_first
class Country {
  final String name;
  final String code;
  final String flagPath;

  Country({
    required this.name,
    required this.code,
    required this.flagPath,
  });

  @override
  String toString() => 'Country(name: $name, code: $code, flagPath: $flagPath)';
}

// List of countries
final countries = [
  Country(name: "United States", code: "us", flagPath: "assets/svg/ic_usa.svg"),
  Country(name: "India", code: "in", flagPath: "assets/svg/ic_india.svg"),
  Country(name: "Canada", code: "ca", flagPath: "assets/svg/ic_canada.svg"),
  Country(name: "United Kingdom", code: "uk", flagPath: "assets/svg/ic_uk.svg"),
  Country(name: "Brazil", code: "br", flagPath: "assets/svg/ic_brazil.svg"),
];
