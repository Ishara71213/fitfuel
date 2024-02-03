import 'package:fitfuel/core/common/domain/entities/user_entity.dart';

abstract class AuthFirebaseRemoteDataSource {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<void> createUser(UserEntity user);
  Future<String> getCurrentUId();
  Future<UserEntity> getCurrentUserById();
}
