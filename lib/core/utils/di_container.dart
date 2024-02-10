import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source.dart';
import 'package:fitfuel/features/clubs/data/data_sources/remote/clubs_firebase_remote_data_source_impl.dart';
import 'package:fitfuel/features/clubs/data/repository_impl/club_repository_impl.dart';
import 'package:fitfuel/features/clubs/domain/repository/club_repository.dart';
import 'package:fitfuel/features/clubs/domain/usecases/get_all_clubs_usecase.dart';
import 'package:fitfuel/features/clubs/presentation/bloc/clubs/clubs_cubit.dart';
import 'package:fitfuel/features/diet_plans/data/data_sources/remote/dietplan_firebase_remote_data_source.dart';
import 'package:fitfuel/features/diet_plans/data/data_sources/remote/dietplan_firebase_remote_data_source_impl.dart';
import 'package:fitfuel/features/diet_plans/data/repository_impl/dietplan_repository_impl.dart';
import 'package:fitfuel/features/diet_plans/domain/repository/dietplan_repository.dart';
import 'package:fitfuel/features/diet_plans/domain/usecases/get_all_clubs_usecase.dart';
import 'package:fitfuel/features/diet_plans/presentation/bloc/dietplan_cubit/diet_plan_cubit.dart';
import 'package:fitfuel/features/diet_plans/presentation/screens/filter_diet_plan_screen.dart';
import 'package:get_it/get_it.dart';

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

  sl.registerFactory<ClubsCubit>(
      () => ClubsCubit(getAllClubsUsecase: sl.call()));

  sl.registerFactory<ProfileCubit>(() => ProfileCubit());

  sl.registerFactory<DietPlanCubit>(
      () => DietPlanCubit(dietPlansUsecase: sl.call()));
  sl.registerFactory<FilterDietPlanScreen>(() => const FilterDietPlanScreen());

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
  sl.registerLazySingleton<GetAllClubsUsecase>(
      () => GetAllClubsUsecase(repository: sl.call()));
  //Diet plan Usecases
  sl.registerLazySingleton<GetAllDietPlansUsecase>(
      () => GetAllDietPlansUsecase(repository: sl.call()));

  //repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<ClubRepository>(
      () => ClubRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<DietPlanRepository>(
      () => DetPlanRepositoryImpl(remoteDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<AuthFirebaseRemoteDataSource>(() =>
      AuthFirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));
  sl.registerLazySingleton<ClubsFirebaseRemoteDataSource>(() =>
      ClubsFirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));
  sl.registerLazySingleton<DietPlansFirebaseRemoteDataSource>(
      () => DietPlanFirebaseRemoteDataSourceImpl(firestore: sl.call()));

  //internal
  // final DbContext dbContext = DbContext.instance;
  // final Database db = await dbContext.database;

  //sl.registerLazySingleton(() => db);

  //external
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
}
