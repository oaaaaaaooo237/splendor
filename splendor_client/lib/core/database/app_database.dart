import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

class GameRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  TextColumn get gameMode => text().withLength(min: 1, max: 20)();
  IntColumn get playerCount => integer()();
  TextColumn get winnerName => text()();
  BoolColumn get youWon => boolean().withDefault(const Constant(false))();
  IntColumn get durationSeconds => integer()();
}

@DriftDatabase(tables: [GameRecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'splendor_v3.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
