import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/auth/data/models/user_model.dart';
import 'package:fitfuel/features/auth/data/data_sources/remote/auth_firebase_remote_data_source.dart';

class AuthFirebaseRemoteDataSourceImpl extends AuthFirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthFirebaseRemoteDataSourceImpl(
      {required this.auth, required this.firestore});

  @override
  Future<void> createUser(UserEntity user) async {
    CollectionReference userCollectionRef;
    userCollectionRef = firestore.collection("Users");

    final uid = await getCurrentUId();

    await userCollectionRef.doc(uid).get().then((value) {
      if (!value.exists) {
        final newUser = UserModel(
          uid: uid,
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          dob: user.dob,
          status: user.status,
          imageUrl: user.imageUrl,
        ).toDocument();

        userCollectionRef.doc(uid).set(newUser);
      }
    });
    return;
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<UserEntity> getCurrentUserById() async {
    CollectionReference userCollectionRef;
    userCollectionRef = firestore.collection("Users");

    final uid = await getCurrentUId();
    UserEntity currentUser = const UserEntity();

    await userCollectionRef.doc(uid).get().then((value) {
      if (value.exists) {
        UserModel user = UserModel.fromSnapshot(value);
        currentUser = user.toEntity();
      }
      return;
    });
    return currentUser;
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async => auth.signInWithEmailAndPassword(
      email: user.email!, password: user.password!);

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
}
