import 'package:sqflite/sqlite_api.dart';

import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/providers/base_provider.dart';

class CityProvider extends BaseProvider<City> {
  CityProvider() : super(tableName: City.tableName, model: City());

  @override
  Future<City> get(int id) async {
    try {
      Batch batch = db.batch();
      batch.rawQuery("SELECT * FROM City WHERE CityId=$id");
      batch.rawQuery(
          "SELECT Weather.* from City INNER JOIN Weather on Weather.cityId = City.CityId WHERE City.CityId=$id");
      var results = await batch.commit();

      var cityQuery = results[0] as List<Map<String, dynamic>>;
      var weatherQuery = results[1] as List<Map<String, dynamic>>;

      if (cityQuery.length > 0) {
        var cityMap = cityQuery.first;
        var city = model.fromMap(cityMap);
        List<Weather> weather = [];
        for (var map in weatherQuery) {
          var newWeather = Weather().fromMap(map);
          weather.add(newWeather);
        }
        city.weather = weather;
        return city;
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> create(City model) async {
    model.updatedCurrent = DateTime.now().toUtc();
    model.updatedDetails = DateTime.now().toUtc();

    try {
      await db.transaction((txn) async {
        Batch batch = txn.batch();
        batch.insert(tableName, model.toMap());
        model.weather?.forEach((weather) {
          batch.insert(Weather.tableName, weather.toMap());
        });
        await batch.commit();
      });
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<City>> getAll() async {
    try {
      var result = await db.rawQuery(
          "SELECT * from City LEFT JOIN Weather on Weather.cityId = City.CityId ORDER BY City.CityId");
      List<City> cities = [];
      int currentCityId = 0;
      City currentCity;
      List<Weather> currentWeather = [];
      result?.forEach((element) {
        int id = element['CityId'];

        // New city
        if (id != currentCityId) {
          // Append to cities
          if (currentCity != null) {
            cities.add(currentCity);
            currentCity.weather = currentWeather;
            currentCity = null;
            currentWeather = [];
          }
          currentCityId = id;
          currentCity = City().fromMap(element);
        }

        if (element['WeatherId'] != null) {
          Weather weather = Weather().fromMap(element);
          currentWeather.add(weather);
        }
      });

      if (currentCity != null) {
        cities.add(currentCity);
        currentCity.weather = currentWeather;
      }
      return cities;
    } catch (_) {
      return null;
    }
  }
}
