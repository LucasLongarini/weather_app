import './base_model.dart';
import './weather.dart';

class City extends BaseModel {
  static const String tableName = 'City';
  double lat;
  double lon;
  String name;
  DateTime updatedCurrent;
  DateTime updatedDetails;
  List<Weather> weather;

  City({
    int id,
    this.lat,
    this.lon,
    this.name,
    this.updatedCurrent,
    this.updatedDetails,
    this.weather
  }) : super(id);

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'lat': lat,
        'lon': lon,
        'name': name,
        'updatedCurrent': updatedCurrent?.millisecondsSinceEpoch ?? null,
        'updatedDetails': updatedDetails?.millisecondsSinceEpoch ?? null,
      };

  @override
  City fromMap(Map<String, dynamic> map) {
    int updatedCurrentInt = map['updatedCurrent'];
    int updatedDetailtsInt = map['updatedDetails'];

    return City(
      id: map['id'],
      lat: map['lat'],
      lon: map['lon'],
      name: map['name'],
      updatedCurrent: updatedCurrentInt != null
          ? DateTime.fromMillisecondsSinceEpoch(updatedCurrentInt, isUtc: true)
          : null,
      updatedDetails: updatedDetailtsInt != null
          ? DateTime.fromMillisecondsSinceEpoch(updatedDetailtsInt, isUtc: true)
          : null,
    );
  }
}
