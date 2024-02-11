import 'package:fitfuel/features/clubs/domain/entities/club_entity.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class GetClubByNameUsecase {
  final ClubRepository _repository;
  GetClubByNameUsecase({required ClubRepository repository})
      : _repository = repository;

  Future<ClubEntity?> call(String name) async {
    return await _repository.getClubByName(name);
  }
}
