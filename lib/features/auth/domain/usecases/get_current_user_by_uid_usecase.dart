import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserByUidUsecase {
  final AuthRepository _repository;

  GetCurrentUserByUidUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<UserEntity> call() async {
    return _repository.getCurrentUserById();
  }
}
