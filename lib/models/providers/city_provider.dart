
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
      batch.rawQuery("SELECT * FROM City WHERE id=$id");
      batch.rawQuery("SELECT Weather.* from City INNER JOIN Weather on Weather.cityId = City.id WHERE City.Id=$id");
      var results = await batch.commit();

      var cityQuery = results[0] as List<Map<String, dynamic>>;
      var weatherQuery = results[1] as List<Map<String, dynamic>>;

      if (cityQuery.length > 0){
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
    }
    catch (_) {
      return null;
    }
  }
  
  @override
  Future<bool> create(City model) async {
    try {
      await db.transaction((txn) async {
        Batch batch = txn.batch();
        batch.insert(tableName, model.toMap());
        for (Weather weather in model.weather)
          batch.insert(Weather.tableName, weather.toMap());
        await batch.commit();
        return true;
      });
      return false;
    }
    catch (_){
      return false;
    }
  }
}