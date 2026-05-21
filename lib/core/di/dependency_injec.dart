import 'package:ali_store/core/networking/api_services.dart';
import 'package:ali_store/core/networking/dio_factory.dart';
import 'package:ali_store/data/model/repo/set_favorite_repo.dart';
import 'package:ali_store/ui/auth/login/logic/cubit/login_cubit.dart';
import 'package:ali_store/ui/auth/login/logic/model/repo/login_repo.dart';
import 'package:ali_store/ui/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:ali_store/ui/auth/signup/logic/model/repo/sign_up_repo.dart';
import 'package:ali_store/ui/auth/signup/verifycode/cubit/verify_code_cubit.dart';
import 'package:ali_store/ui/auth/signup/verifycode/model/repo/verify_code_repo.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/data/model/repo/categories_repo.dart';
import 'package:ali_store/data/model/repo/items_repo.dart';
import 'package:ali_store/ui/bottom_bar/search/logic/cubit/search_cubit.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // verify code
  getIt.registerLazySingleton<VerifyCodeRepo>(() => VerifyCodeRepo(getIt()));
  getIt.registerFactory<VerifyCodeCubit>(() => VerifyCodeCubit(getIt()));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //home
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));
  getIt.registerLazySingleton<ItemsRepo>(() => ItemsRepo(getIt()));
  getIt.registerLazySingleton<SetFavoriteRepo>(() => SetFavoriteRepo(getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt(), getIt(), getIt()));
  
  //search
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt(), getIt()),
  );
}
