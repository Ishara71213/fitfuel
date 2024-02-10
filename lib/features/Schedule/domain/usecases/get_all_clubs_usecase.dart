import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class GetAllClubsUsecase {
  final ClubRepository _repository;
  GetAllClubsUsecase({required ClubRepository repository})
      : _repository = repository;

  Future<List<ClubEntity>> call() async {
    return await _repository.getAllClubs();
  }
}
