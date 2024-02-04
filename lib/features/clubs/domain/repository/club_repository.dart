import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';

abstract class ClubRepository {
  Future<List<ClubEntity>> getAllClubs();
}
