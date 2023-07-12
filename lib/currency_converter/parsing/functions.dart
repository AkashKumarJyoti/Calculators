import 'package:http/http.dart';
import '../model/currencies_model.dart';
import '../model/exchange_rates.dart';

Future<Map> fetchcurrencies() async
{
  String url1 = "https://openexchangerates.org/api/currencies.json";
  Response response = await get(Uri.parse(url1));
  final allCurrencies = allCurrenciesFromJson(response.body);

  return allCurrencies;
}

Future<RatesModel> fetchRates() async {
  String url2 = "https://openexchangerates.org/api/latest.json?app_id=e84fc4a6105540e9b981a5abe3d58e8b";
  Response response = await get(Uri.parse(url2));
  final allRates = ratesModelFromJson(response.body);

  // Return the rates as Map<dynamic, dynamic>
  return allRates;
}
