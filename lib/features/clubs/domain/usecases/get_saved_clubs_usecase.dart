import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class GetSavedClubsUsecase {
  final ClubRepository _repository;
  GetSavedClubsUsecase({required ClubRepository repository})
      : _repository = repository;

  Future<List<ClubEntity>> call() async {
    return await _repository.getSavedClubs();
  }
}
