import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

abstract class ClubsFirebaseRemoteDataSource {
  Future<List<ClubEntity>> getAllClubs();
}
