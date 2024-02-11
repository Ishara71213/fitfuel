import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfuel/core/utils/db_context.dart';
import 'package:fitfuel/features/app/presentation/bloc/profile/profile_cubit.dart';
import 'package:fitfuel/features/auth/data/data_sources/remote/auth_firebase_remote_data_source.dart';
import 'package:fitfuel/features/auth/data/data_sources/remote/auth_firebase_remote_data_source_impl.dart';
import 'package:fitfuel/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:fitfuel/features/auth/domain/repository/auth_repository.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/get_current_user_by_uid_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:fitfuel/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:fitfuel/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:fitfuel/features/auth/presentation/bloc/user/user_cubit.dart';
import 'package:fitfuel/features/clubs/data/data_sources/local/clubs_local_data_source.dart';
import 'package:fitfuel/features/clubs/data/data_sources/local/clubs_local_data_source_impl.dart';
import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source.dart';
import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source_impl.dart';
import 'package:fitfuel/features/clubs/data/repository_impl/club_repository_impl.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_all_clubs_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_club_by_name_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_saved_clubs_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/remove_club_by_name_usecase.dart';
import 'package:fitfuel/features/clubs/domain/usecases/save_club_usecase.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/saved_club/saved_club_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Bloc/cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      getCurrentUIdUsecase: sl.call(),
      isSignInUsecase: sl.call(),
      signOutUsecase: sl.call()));

  sl.registerFactory<UserCubit>(() => UserCubit(
      signInUsecase: sl.call(),
      signUpUsecase: sl.call(),
      createUserUsecase: sl.call(),
      getCurrentUIdUsecase: sl.call(),
      getCurrentUserByUidUsecase: sl.call()));

  sl.registerFactory<ClubsCubit>(() => ClubsCubit(
        getAllClubsUsecase: sl.call(),
      ));

  sl.registerFactory<SavedClubCubit>(() => SavedClubCubit(
        getSavedClubsUsecase: sl.call(),
        saveClubsUsecase: sl.call(),
        removeClubByNameUsecase: sl.call(),
        getClubByNameUsecase: sl.call(),
      ));

  sl.registerFactory<ProfileCubit>(() => ProfileCubit());

  //usecase
  //Auth Usecase
  sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUsecase>(
      () => IsSignInUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIdUsecase>(
      () => GetCurrentUIdUsecase(repository: sl.call()));
  sl.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserByUidUsecase>(
      () => GetCurrentUserByUidUsecase(repository: sl.call()));

  // club Usecase
  //remote data
  sl.registerLazySingleton<GetAllClubsUsecase>(
      () => GetAllClubsUsecase(repository: sl.call()));
  //local data
  sl.registerLazySingleton<GetSavedClubsUsecase>(
      () => GetSavedClubsUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetClubByNameUsecase>(
      () => GetClubByNameUsecase(repository: sl.call()));
  sl.registerLazySingleton<RemoveClubByNameUsecase>(
      () => RemoveClubByNameUsecase(repository: sl.call()));
  sl.registerLazySingleton<SaveClubsUsecase>(
      () => SaveClubsUsecase(repository: sl.call()));

  //repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<ClubRepository>(() => ClubRepositoryImpl(
      remoteDataSource: sl.call(), localDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<AuthFirebaseRemoteDataSource>(() =>
      AuthFirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));
  sl.registerLazySingleton<ClubsFirebaseRemoteDataSource>(() =>
      ClubsFirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));
  sl.registerLazySingleton<ClubsLocalDataSource>(
      () => ClubsLocalDataSourceImpl(db: sl.call()));

  //internal
  final DbContext dbContext = DbContext.instance;
  final Database db = await dbContext.database;

  sl.registerLazySingleton(() => db);

  //external
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
}
