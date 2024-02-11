import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class SaveClubsUsecase {
  final ClubRepository _repository;
  SaveClubsUsecase({required ClubRepository repository})
      : _repository = repository;

  Future<ClubEntity> call(ClubEntity entity) async {
    return await _repository.saveClub(entity);
  }
}
