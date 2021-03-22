import 'package:weather_app/models/base_model.dart';
import 'enums/WeatherType.dart';

class Weather extends BaseModel {
  static const String tableName = 'Weather';
  int cityId;
  DateTime date;
  WeatherType type;
  int weatherTag;
  String weatherDescription;
  double temperature;
  double temperatureFeelLike;
  double temperatureMax;
  double temperatureMin;
  double pressure;
  double humidity;
  double windSpeed;
  double rainProbability;

  Weather({
    int id,
    this.cityId,
    this.date,
    this.type,
    this.weatherTag,
    this.weatherDescription,
    this.temperature,
    this.temperatureFeelLike,
    this.temperatureMax,
    this.temperatureMin,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.rainProbability,
  }) : super(id);

  @override
  Map<String, dynamic> toMap() => {
        'WeatherId': id,
        'cityId': cityId,
        'date': date?.millisecondsSinceEpoch ?? null,
        'type': type.toShortString(),
        'weatherTag': weatherTag,
        'weatherDescription': weatherDescription,
        'temperature': temperature,
        'temperatureFeelLike': temperatureFeelLike,
        'temperatureMax': temperatureMax,
        'temperatureMin': temperatureMin,
        'pressure': pressure,
        'humidity': humidity,
        'windSpeed': windSpeed,
        'rainProbability': rainProbability,
      };

  @override
  Weather fromMap(Map<String, dynamic> map) {
    int dateInt = map['date'];

    return Weather(
      id: map['WeatherId'],
      cityId: map['cityId'],
      date: dateInt != null
          ? DateTime.fromMillisecondsSinceEpoch(dateInt, isUtc: true)
          : null,
      type: WeatherType.daily.fromString(map['type']),
      weatherTag: map['weatherTag'],
      weatherDescription: map['weatherDescription'],
      temperature: map['temperature'],
      temperatureFeelLike: map['temperatureFeelLike'],
      temperatureMax: map['temperatureMax'],
      temperatureMin: map['temperatureMin'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      windSpeed: map['windSpeed'],
      rainProbability: map['rainProbability'],
    );
  }
}
