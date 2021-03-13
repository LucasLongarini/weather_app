import 'package:weather_app/models/base_model.dart';

class Weather extends BaseModel {
  int id;
  int weatherId;
  String weatherDescription;

  Weather({this.id, this.weatherId, this.weatherDescription});

  Map<String, dynamic> toMap() {}

  Weather.fromMap(Map<String, dynamic> map) {}
}
