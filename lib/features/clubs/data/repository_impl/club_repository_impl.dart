import 'package:fitfuel/features/clubs/data/data_sources/local/clubs_local_data_source.dart';
import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class ClubRepositoryImpl implements ClubRepository {
  ClubsFirebaseRemoteDataSource remoteDataSource;
  ClubsLocalDataSource localDataSource;
  ClubRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
  @override
  Future<List<ClubEntity>> getAllClubs() async =>
      await remoteDataSource.getAllClubs();

  @override
  Future<ClubEntity?> getClubByName(String name) async =>
      await localDataSource.getClubByName(name);

  @override
  Future<List<ClubEntity>> getSavedClubs() async =>
      await localDataSource.getSavedClubs();

  @override
  Future<bool> removeClubByName(String name) async =>
      await localDataSource.removeClubByName(name);

  @override
  Future<ClubEntity> saveClub(ClubEntity entity) async =>
      await localDataSource.saveClub(entity);
}
