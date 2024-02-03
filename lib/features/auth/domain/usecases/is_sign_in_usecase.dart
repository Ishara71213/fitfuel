import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class IsSignInUsecase {
  final AuthRepository _repository;

  IsSignInUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<bool> call() async {
    return _repository.isSignIn();
  }
}
