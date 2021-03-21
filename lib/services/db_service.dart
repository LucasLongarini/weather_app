import 'package:sqflite/sqflite.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:path/path.dart';

// TODO: replace this with configuration (.env)
const String DB_NAME = 'database.sqlite';

class DBService {
  Database database;
  final _migrationService = GetIt.I.get<DatabaseMigrationService>();

  Future initalize() async {
    var dbPath = await getDatabasesPath();
    database = await openDatabase(join(dbPath, DB_NAME), onConfigure: _onConfigure, version: 1);

    await _migrationService.runMigration(
      database,
      migrationFiles: ['1_create_schema.sql'],
      verbose: true
    );
  }

  // Turn on foreign key contraints
  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
