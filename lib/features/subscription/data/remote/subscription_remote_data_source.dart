import 'package:fitfuel/core/common/domain/entities/user_entity.dart';

abstract class SubscriptionRemoteDataSource {
  Future<UserEntity> subscribe(UserEntity entity);
}
