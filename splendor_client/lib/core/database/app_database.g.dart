// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GameRecordsTable extends GameRecords
    with TableInfo<$GameRecordsTable, GameRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameRecordsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _gameModeMeta = const VerificationMeta(
    'gameMode',
  );
  @override
  late final GeneratedColumn<String> gameMode = GeneratedColumn<String>(
    'game_mode',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerCountMeta = const VerificationMeta(
    'playerCount',
  );
  @override
  late final GeneratedColumn<int> playerCount = GeneratedColumn<int>(
    'player_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _winnerNameMeta = const VerificationMeta(
    'winnerName',
  );
  @override
  late final GeneratedColumn<String> winnerName = GeneratedColumn<String>(
    'winner_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _youWonMeta = const VerificationMeta('youWon');
  @override
  late final GeneratedColumn<bool> youWon = GeneratedColumn<bool>(
    'you_won',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("you_won" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    timestamp,
    gameMode,
    playerCount,
    winnerName,
    youWon,
    durationSeconds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    if (data.containsKey('game_mode')) {
      context.handle(
        _gameModeMeta,
        gameMode.isAcceptableOrUnknown(data['game_mode']!, _gameModeMeta),
      );
    } else if (isInserting) {
      context.missing(_gameModeMeta);
    }
    if (data.containsKey('player_count')) {
      context.handle(
        _playerCountMeta,
        playerCount.isAcceptableOrUnknown(
          data['player_count']!,
          _playerCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_playerCountMeta);
    }
    if (data.containsKey('winner_name')) {
      context.handle(
        _winnerNameMeta,
        winnerName.isAcceptableOrUnknown(data['winner_name']!, _winnerNameMeta),
      );
    } else if (isInserting) {
      context.missing(_winnerNameMeta);
    }
    if (data.containsKey('you_won')) {
      context.handle(
        _youWonMeta,
        youWon.isAcceptableOrUnknown(data['you_won']!, _youWonMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      gameMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_mode'],
      )!,
      playerCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_count'],
      )!,
      winnerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}winner_name'],
      )!,
      youWon: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}you_won'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
    );
  }

  @override
  $GameRecordsTable createAlias(String alias) {
    return $GameRecordsTable(attachedDatabase, alias);
  }
}

class GameRecord extends DataClass implements Insertable<GameRecord> {
  final int id;
  final DateTime timestamp;
  final String gameMode;
  final int playerCount;
  final String winnerName;
  final bool youWon;
  final int durationSeconds;
  const GameRecord({
    required this.id,
    required this.timestamp,
    required this.gameMode,
    required this.playerCount,
    required this.winnerName,
    required this.youWon,
    required this.durationSeconds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['game_mode'] = Variable<String>(gameMode);
    map['player_count'] = Variable<int>(playerCount);
    map['winner_name'] = Variable<String>(winnerName);
    map['you_won'] = Variable<bool>(youWon);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    return map;
  }

  GameRecordsCompanion toCompanion(bool nullToAbsent) {
    return GameRecordsCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      gameMode: Value(gameMode),
      playerCount: Value(playerCount),
      winnerName: Value(winnerName),
      youWon: Value(youWon),
      durationSeconds: Value(durationSeconds),
    );
  }

  factory GameRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameRecord(
      id: serializer.fromJson<int>(json['id']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      gameMode: serializer.fromJson<String>(json['gameMode']),
      playerCount: serializer.fromJson<int>(json['playerCount']),
      winnerName: serializer.fromJson<String>(json['winnerName']),
      youWon: serializer.fromJson<bool>(json['youWon']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'gameMode': serializer.toJson<String>(gameMode),
      'playerCount': serializer.toJson<int>(playerCount),
      'winnerName': serializer.toJson<String>(winnerName),
      'youWon': serializer.toJson<bool>(youWon),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
    };
  }

  GameRecord copyWith({
    int? id,
    DateTime? timestamp,
    String? gameMode,
    int? playerCount,
    String? winnerName,
    bool? youWon,
    int? durationSeconds,
  }) => GameRecord(
    id: id ?? this.id,
    timestamp: timestamp ?? this.timestamp,
    gameMode: gameMode ?? this.gameMode,
    playerCount: playerCount ?? this.playerCount,
    winnerName: winnerName ?? this.winnerName,
    youWon: youWon ?? this.youWon,
    durationSeconds: durationSeconds ?? this.durationSeconds,
  );
  GameRecord copyWithCompanion(GameRecordsCompanion data) {
    return GameRecord(
      id: data.id.present ? data.id.value : this.id,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      gameMode: data.gameMode.present ? data.gameMode.value : this.gameMode,
      playerCount: data.playerCount.present
          ? data.playerCount.value
          : this.playerCount,
      winnerName: data.winnerName.present
          ? data.winnerName.value
          : this.winnerName,
      youWon: data.youWon.present ? data.youWon.value : this.youWon,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameRecord(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('gameMode: $gameMode, ')
          ..write('playerCount: $playerCount, ')
          ..write('winnerName: $winnerName, ')
          ..write('youWon: $youWon, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    timestamp,
    gameMode,
    playerCount,
    winnerName,
    youWon,
    durationSeconds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameRecord &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.gameMode == this.gameMode &&
          other.playerCount == this.playerCount &&
          other.winnerName == this.winnerName &&
          other.youWon == this.youWon &&
          other.durationSeconds == this.durationSeconds);
}

class GameRecordsCompanion extends UpdateCompanion<GameRecord> {
  final Value<int> id;
  final Value<DateTime> timestamp;
  final Value<String> gameMode;
  final Value<int> playerCount;
  final Value<String> winnerName;
  final Value<bool> youWon;
  final Value<int> durationSeconds;
  const GameRecordsCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.gameMode = const Value.absent(),
    this.playerCount = const Value.absent(),
    this.winnerName = const Value.absent(),
    this.youWon = const Value.absent(),
    this.durationSeconds = const Value.absent(),
  });
  GameRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    required String gameMode,
    required int playerCount,
    required String winnerName,
    this.youWon = const Value.absent(),
    required int durationSeconds,
  }) : gameMode = Value(gameMode),
       playerCount = Value(playerCount),
       winnerName = Value(winnerName),
       durationSeconds = Value(durationSeconds);
  static Insertable<GameRecord> custom({
    Expression<int>? id,
    Expression<DateTime>? timestamp,
    Expression<String>? gameMode,
    Expression<int>? playerCount,
    Expression<String>? winnerName,
    Expression<bool>? youWon,
    Expression<int>? durationSeconds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (gameMode != null) 'game_mode': gameMode,
      if (playerCount != null) 'player_count': playerCount,
      if (winnerName != null) 'winner_name': winnerName,
      if (youWon != null) 'you_won': youWon,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
    });
  }

  GameRecordsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? timestamp,
    Value<String>? gameMode,
    Value<int>? playerCount,
    Value<String>? winnerName,
    Value<bool>? youWon,
    Value<int>? durationSeconds,
  }) {
    return GameRecordsCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      gameMode: gameMode ?? this.gameMode,
      playerCount: playerCount ?? this.playerCount,
      winnerName: winnerName ?? this.winnerName,
      youWon: youWon ?? this.youWon,
      durationSeconds: durationSeconds ?? this.durationSeconds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (gameMode.present) {
      map['game_mode'] = Variable<String>(gameMode.value);
    }
    if (playerCount.present) {
      map['player_count'] = Variable<int>(playerCount.value);
    }
    if (winnerName.present) {
      map['winner_name'] = Variable<String>(winnerName.value);
    }
    if (youWon.present) {
      map['you_won'] = Variable<bool>(youWon.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameRecordsCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('gameMode: $gameMode, ')
          ..write('playerCount: $playerCount, ')
          ..write('winnerName: $winnerName, ')
          ..write('youWon: $youWon, ')
          ..write('durationSeconds: $durationSeconds')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GameRecordsTable gameRecords = $GameRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gameRecords];
}

typedef $$GameRecordsTableCreateCompanionBuilder =
    GameRecordsCompanion Function({
      Value<int> id,
      Value<DateTime> timestamp,
      required String gameMode,
      required int playerCount,
      required String winnerName,
      Value<bool> youWon,
      required int durationSeconds,
    });
typedef $$GameRecordsTableUpdateCompanionBuilder =
    GameRecordsCompanion Function({
      Value<int> id,
      Value<DateTime> timestamp,
      Value<String> gameMode,
      Value<int> playerCount,
      Value<String> winnerName,
      Value<bool> youWon,
      Value<int> durationSeconds,
    });

class $$GameRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $GameRecordsTable> {
  $$GameRecordsTableFilterComposer({
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

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameMode => $composableBuilder(
    column: $table.gameMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playerCount => $composableBuilder(
    column: $table.playerCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get winnerName => $composableBuilder(
    column: $table.winnerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get youWon => $composableBuilder(
    column: $table.youWon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GameRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameRecordsTable> {
  $$GameRecordsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameMode => $composableBuilder(
    column: $table.gameMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playerCount => $composableBuilder(
    column: $table.playerCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get winnerName => $composableBuilder(
    column: $table.winnerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get youWon => $composableBuilder(
    column: $table.youWon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GameRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameRecordsTable> {
  $$GameRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get gameMode =>
      $composableBuilder(column: $table.gameMode, builder: (column) => column);

  GeneratedColumn<int> get playerCount => $composableBuilder(
    column: $table.playerCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get winnerName => $composableBuilder(
    column: $table.winnerName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get youWon =>
      $composableBuilder(column: $table.youWon, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );
}

class $$GameRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameRecordsTable,
          GameRecord,
          $$GameRecordsTableFilterComposer,
          $$GameRecordsTableOrderingComposer,
          $$GameRecordsTableAnnotationComposer,
          $$GameRecordsTableCreateCompanionBuilder,
          $$GameRecordsTableUpdateCompanionBuilder,
          (
            GameRecord,
            BaseReferences<_$AppDatabase, $GameRecordsTable, GameRecord>,
          ),
          GameRecord,
          PrefetchHooks Function()
        > {
  $$GameRecordsTableTableManager(_$AppDatabase db, $GameRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> gameMode = const Value.absent(),
                Value<int> playerCount = const Value.absent(),
                Value<String> winnerName = const Value.absent(),
                Value<bool> youWon = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
              }) => GameRecordsCompanion(
                id: id,
                timestamp: timestamp,
                gameMode: gameMode,
                playerCount: playerCount,
                winnerName: winnerName,
                youWon: youWon,
                durationSeconds: durationSeconds,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                required String gameMode,
                required int playerCount,
                required String winnerName,
                Value<bool> youWon = const Value.absent(),
                required int durationSeconds,
              }) => GameRecordsCompanion.insert(
                id: id,
                timestamp: timestamp,
                gameMode: gameMode,
                playerCount: playerCount,
                winnerName: winnerName,
                youWon: youWon,
                durationSeconds: durationSeconds,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GameRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameRecordsTable,
      GameRecord,
      $$GameRecordsTableFilterComposer,
      $$GameRecordsTableOrderingComposer,
      $$GameRecordsTableAnnotationComposer,
      $$GameRecordsTableCreateCompanionBuilder,
      $$GameRecordsTableUpdateCompanionBuilder,
      (
        GameRecord,
        BaseReferences<_$AppDatabase, $GameRecordsTable, GameRecord>,
      ),
      GameRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameRecordsTableTableManager get gameRecords =>
      $$GameRecordsTableTableManager(_db, _db.gameRecords);
}
