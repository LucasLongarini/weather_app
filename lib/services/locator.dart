import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

import 'db_service.dart';
import '../models/providers/city_provider.dart';
import '../models/providers/weather_provider.dart';

void setupServices() {
  GetIt.I.registerLazySingleton(() => DatabaseMigrationService());
  GetIt.I.registerLazySingleton(() => DBService());

  // Providers
  GetIt.I.registerLazySingleton(() => CityProvider());
  GetIt.I.registerLazySingleton(() => WeatherProvider());
}