import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class SignInUsecase {
  final AuthRepository _repository;

  SignInUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<void> call(UserEntity user) async {
    return _repository.signIn(user);
  }
}
