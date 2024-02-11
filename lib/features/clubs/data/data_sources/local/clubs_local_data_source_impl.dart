import 'package:fitfuel/core/constants/db_tables.dart';
import 'package:fitfuel/features/clubs/data/data_sources/local/clubs_local_data_source.dart';
import 'package:fitfuel/features/clubs/data/models/club_model.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

import 'package:sqflite/sqflite.dart';

class ClubsLocalDataSourceImpl implements ClubsLocalDataSource {
  final Database db;
  ClubsLocalDataSourceImpl({required this.db});

  @override
  Future<List<ClubEntity>> getSavedClubs() async {
    List<ClubEntity> entityList = [];
    final result = await db.query(
      DbTables.savedclubs,
      columns: ClubFields.columns,
    );
    List<ClubModel> modelList =
        result.map((e) => ClubModel.fromJson(e)).toList();

    for (ClubModel model in modelList) {
      ClubEntity entity = model.toEntity();
      // fetch Data to inverse Order
      entityList.insert(0, entity);
    }
    return entityList;
  }

  @override
  Future<ClubEntity?> getClubByName(String name) async {
    final maps = await db.query(
      DbTables.savedclubs,
      columns: ClubFields.columns,
      where: '${ClubFields.clubName} = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      ClubModel result = ClubModel.fromJson(maps.first);
      ClubEntity entity = result.toEntity();
      return entity;
    } else {
      return null;
    }
  }

  @override
  Future<bool> removeClubByName(String name) async {
    final result = await db.delete(
      DbTables.savedclubs,
      where: '${ClubFields.clubName} = ?',
      whereArgs: [name],
    );
    if (result > 0) {
      return true;
    } else {
      throw Exception("Failded To delete data");
    }
  }

  @override
  Future<ClubEntity> saveClub(ClubEntity entity) async {
    ClubModel model = ClubModel.fromEntity(entity);

    final id = await db.insert(DbTables.savedclubs, model.toJson());
    if (id == 0) {
      model = model.copyWith(isSaved: false);
      return model.toEntity();
    } else {
      model = model.copyWith(isSaved: true);
      return model.toEntity();
    }
  }
}
