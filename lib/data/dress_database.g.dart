// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dress_database.dart';

// ignore_for_file: type=lint
class $DressTable extends Dress with TableInfo<$DressTable, DressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, color, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dress';
  @override
  VerificationContext validateIntegrity(
    Insertable<DressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DressData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      color:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}color'],
          )!,
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
    );
  }

  @override
  $DressTable createAlias(String alias) {
    return $DressTable(attachedDatabase, alias);
  }
}

class DressData extends DataClass implements Insertable<DressData> {
  final int id;
  final String name;
  final String color;
  final String imageUrl;
  const DressData({
    required this.id,
    required this.name,
    required this.color,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  DressCompanion toCompanion(bool nullToAbsent) {
    return DressCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      imageUrl: Value(imageUrl),
    );
  }

  factory DressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DressData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  DressData copyWith({
    int? id,
    String? name,
    String? color,
    String? imageUrl,
  }) => DressData(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color ?? this.color,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  DressData copyWithCompanion(DressCompanion data) {
    return DressData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DressData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DressData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.imageUrl == this.imageUrl);
}

class DressCompanion extends UpdateCompanion<DressData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<String> imageUrl;
  const DressCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  DressCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
    required String imageUrl,
  }) : name = Value(name),
       color = Value(color),
       imageUrl = Value(imageUrl);
  static Insertable<DressData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  DressCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? color,
    Value<String>? imageUrl,
  }) {
    return DressCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DressCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$DressDatabase extends GeneratedDatabase {
  _$DressDatabase(QueryExecutor e) : super(e);
  $DressDatabaseManager get managers => $DressDatabaseManager(this);
  late final $DressTable dress = $DressTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dress];
}

typedef $$DressTableCreateCompanionBuilder =
    DressCompanion Function({
      Value<int> id,
      required String name,
      required String color,
      required String imageUrl,
    });
typedef $$DressTableUpdateCompanionBuilder =
    DressCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> color,
      Value<String> imageUrl,
    });

class $$DressTableFilterComposer
    extends Composer<_$DressDatabase, $DressTable> {
  $$DressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DressTableOrderingComposer
    extends Composer<_$DressDatabase, $DressTable> {
  $$DressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DressTableAnnotationComposer
    extends Composer<_$DressDatabase, $DressTable> {
  $$DressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$DressTableTableManager
    extends
        RootTableManager<
          _$DressDatabase,
          $DressTable,
          DressData,
          $$DressTableFilterComposer,
          $$DressTableOrderingComposer,
          $$DressTableAnnotationComposer,
          $$DressTableCreateCompanionBuilder,
          $$DressTableUpdateCompanionBuilder,
          (DressData, BaseReferences<_$DressDatabase, $DressTable, DressData>),
          DressData,
          PrefetchHooks Function()
        > {
  $$DressTableTableManager(_$DressDatabase db, $DressTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DressTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
              }) => DressCompanion(
                id: id,
                name: name,
                color: color,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String color,
                required String imageUrl,
              }) => DressCompanion.insert(
                id: id,
                name: name,
                color: color,
                imageUrl: imageUrl,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DressTableProcessedTableManager =
    ProcessedTableManager<
      _$DressDatabase,
      $DressTable,
      DressData,
      $$DressTableFilterComposer,
      $$DressTableOrderingComposer,
      $$DressTableAnnotationComposer,
      $$DressTableCreateCompanionBuilder,
      $$DressTableUpdateCompanionBuilder,
      (DressData, BaseReferences<_$DressDatabase, $DressTable, DressData>),
      DressData,
      PrefetchHooks Function()
    >;

class $DressDatabaseManager {
  final _$DressDatabase _db;
  $DressDatabaseManager(this._db);
  $$DressTableTableManager get dress =>
      $$DressTableTableManager(_db, _db.dress);
}
