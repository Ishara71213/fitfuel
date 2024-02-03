import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository _repository;

  SignUpUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<void> call(UserEntity user) async {
    return _repository.signUp(user);
  }
}
