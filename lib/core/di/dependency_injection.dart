import 'package:dio/dio.dart';
import 'package:flutter_advance/core/networking/api_services.dart';
import 'package:flutter_advance/core/networking/dio_factory.dart';
import 'package:flutter_advance/features/login/data/repo/login_repo.dart';
import 'package:flutter_advance/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advance/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter_advance/features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio && Api Servies
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

//
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //g
    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //
  
}
