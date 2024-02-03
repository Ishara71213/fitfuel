import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUIdUsecase {
  final AuthRepository _repository;

  GetCurrentUIdUsecase({required AuthRepository repository})
      : _repository = repository;

  Future<String> call() async {
    return _repository.getCurrentUId();
  }
}
