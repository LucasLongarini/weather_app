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
    // bool success1 = await _cityProvider.create(City(id: 2, lat: 20, name: "Calgary", lon: 23 ));
    // bool success2 = await _weatherProvider.create(Weather(cityId: 2, humidity: 1, pressure: 1, rainProbability: 0, temperature: 0, temperatureMax: 0, weatherTag: 1, date: null, temperatureFeelLike: 0, temperatureMin: 0, type: WeatherType.daily, windSpeed: 1, weatherDescription: "hello"));
    // bool success3 = await _weatherProvider.create(Weather(cityId: 2, humidity: 1, pressure: 1, rainProbability: 0, temperature: 0, temperatureMax: 0, weatherTag: 1, date: null, temperatureFeelLike: 0, temperatureMin: 0, type: WeatherType.daily, windSpeed: 1, weatherDescription: "hello"));
    List<City> cities = await _cityProvider.getAll();
    // City city = await _cityProvider.get(2);
    super.onInit();
  }
}
