import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source.dart';
import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class ClubRepositoryImpl implements ClubRepository {
  ClubsFirebaseRemoteDataSource remoteDataSource;
  ClubRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<ClubEntity>> getAllClubs() async =>
      await remoteDataSource.getAllClubs();
}
