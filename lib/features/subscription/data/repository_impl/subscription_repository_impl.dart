import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/subscription/data/remote/subscription_remote_data_source.dart';
import 'package:fitfuel/features/subscription/domain/repository/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  SubscriptionRemoteDataSource remoteDataSource;
  SubscriptionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> subscribe(UserEntity entity) async =>
      await remoteDataSource.subscribe(entity);
}
