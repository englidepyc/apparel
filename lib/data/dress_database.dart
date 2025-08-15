import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// We'll tell drift to generate a file called app_database.g.dart
part 'dress_database.g.dart';

class Dress extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get color => text()();
  TextColumn get imageUrl => text()();
}

@DriftDatabase(tables: [Dress])
class DressDatabase extends _$DressDatabase {
  DressDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // This function is responsible for opening the database connection
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }

  //**CRUD operations**
  Stream<List<DressData>> getDresses() {
    return select(dress).watch();
  }

  Future<int> insertDress(DressCompanion entry) {
    return into(dress).insert(entry);
  }

  Future<int> removeDress(int id) {
    return (delete(dress)..where((t) => t.id.equals(id))).go();
  }

  //EXTERNAL DATA FUNCTIONS
  Future<int> insertDressFromData({
    required String name,
    required String color,
    required String imageUrl,
  }) {
    return insertDress(
      DressCompanion(
        color: Value(color),
        name: Value(name),
        imageUrl: Value(imageUrl),
      ),
    );
  }
}
