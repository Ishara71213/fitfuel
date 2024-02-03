import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository _repository;

  SignOutUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<void> call() async {
    return _repository.signOut();
  }
}
