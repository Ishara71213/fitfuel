import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class UpdateUserDataUsecase {
  final AuthRepository _repository;

  UpdateUserDataUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<UserEntity> call(UserEntity entity) async {
    return await _repository.updateUserData(entity);
  }
}
