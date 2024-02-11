import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

abstract class ClubRepository {
  Future<List<ClubEntity>> getAllClubs();
  //local data source
  Future<List<ClubEntity>> getSavedClubs();
  Future<ClubEntity> saveClub(ClubEntity entity);
  Future<bool> removeClubByName(String name);
  Future<ClubEntity?> getClubByName(String name);
}
