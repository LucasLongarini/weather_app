
/// An absctraction of the weather service
abstract class IWeatherService {

  /// Returns the weather data of the current location
  int getCurrentLocation();

  /// Returns the weather data of all saved locations
  List<int> getSavedLocations();

}