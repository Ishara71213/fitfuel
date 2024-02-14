import 'package:fitfuel/core/common/domain/entities/user_entity.dart';

abstract class SubscriptionRepository {
  Future<UserEntity> subscribe(UserEntity entity);
}
