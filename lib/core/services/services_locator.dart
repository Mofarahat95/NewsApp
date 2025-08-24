import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/core/services/api_services.dart';
import 'package:news/features/home/data/repos/home_remote_ds_impl.dart';
import 'package:news/features/home/data/repos/local_home_ds_impl.dart';

final getIt = GetIt.instance;

setupServicesLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRemoteDataImpl>(
    HomeRemoteDataImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<HomeLocalDataImpl>(
    HomeLocalDataImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
