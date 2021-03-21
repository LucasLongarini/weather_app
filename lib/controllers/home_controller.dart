import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/models/enums/WeatherType.dart';

import '../models/providers/city_provider.dart';
import '../models/providers/weather_provider.dart';
import '../models/all.dart';

class HomeController extends GetxController {
  final _cityProvider = GetIt.I.get<CityProvider>();
  final _weatherProvider = GetIt.I.get<WeatherProvider>();

  @override
  void onInit() async {
    //Tests
    // bool success = await _weatherProvider.create(Weather(cityId: 0, humidity: 1, pressure: 1, rainProbability: 0, temperature: 0, temperatureMax: 0, weatherId: 1, date: null, temperatureFeelLike: 0, temperatureMin: 0, type: WeatherType.daily, windSpeed: 1, weatherDescription: "hello"));
    // List<City> cities = await _cityProvider.getAll();
    City city = await _cityProvider.get(1);
    print(city);
    super.onInit();
  }
}
