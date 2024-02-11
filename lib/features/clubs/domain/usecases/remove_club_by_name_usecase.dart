import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';

class RemoveClubByNameUsecase {
  final ClubRepository _repository;
  RemoveClubByNameUsecase({required ClubRepository repository})
      : _repository = repository;

  Future<bool> call(String name) async {
    return await _repository.removeClubByName(name);
  }
}
