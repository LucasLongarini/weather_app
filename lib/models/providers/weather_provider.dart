
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/providers/base_provider.dart';

class WeatherProvider extends BaseProvider<Weather> {
  WeatherProvider() : super(tableName: Weather.tableName, model: Weather());
}