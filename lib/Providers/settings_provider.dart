import 'package:flutter/material.dart';
import '../models/country.dart';

class SettingsProvider extends ChangeNotifier {
  Country _currencyCountry = Country(code: 'GH', flagAsset: 'assets/flags/gh.png');

  Country get currencyCountry => _currencyCountry;

  void setCurrencyCountry(Country country) {
    _currencyCountry = country;
    notifyListeners();
  }
}