import 'package:fitfuel/core/common/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> createUser(UserEntity user);
  Future<String> getCurrentUId();
  Future<UserEntity> getCurrentUserById();
  Future<UserEntity> updateUserData(UserEntity entity);
}
