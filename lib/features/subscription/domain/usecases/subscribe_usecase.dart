import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/subscription/domain/repository/subscription_repository.dart';

class SubscribeUsecase {
  final SubscriptionRepository _repository;
  SubscribeUsecase({required SubscriptionRepository repository})
      : _repository = repository;

  Future<UserEntity> call(UserEntity entity) async {
    return await _repository.subscribe(entity);
  }
}
