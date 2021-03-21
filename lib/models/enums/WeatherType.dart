enum WeatherType {
  daily,
  hourly,
}

extension ParseToString on WeatherType {
  String toShortString() {
    return this.toString().split('.').last;
  }

  WeatherType fromString(String s) {
    if (s == 'daily')
      return WeatherType.daily;
    else if (s == 'hourly')
      return WeatherType.hourly;
    return null;
  }
}