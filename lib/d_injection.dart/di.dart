import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:keywa_test_application/bloc/home_bloc.dart';
import 'package:keywa_test_application/data/datasource/crypto_list_datasource.dart';
import 'package:keywa_test_application/data/repository/crypto_list_repository.dart';

var locator = GetIt.instance;
void initLocator() {
  locator.registerFactory<Dio>(
    () => Dio(
      BaseOptions(baseUrl: 'https://api.coincap.io/v2/assets'),
    ),
  );

  locator.registerFactory<ICryptoDataSoruce>(
    () => CryptoRemoteDataSource(
      locator.get(),
    ),
  );
  locator.registerFactory<ICryptoRepository>(
    () => CryptoRemoteRepository(
      locator.get(),
    ),
  );
  locator.registerFactory<HomeBloc>(
    () => HomeBloc(
      locator.get(),
    ),
  );
}
