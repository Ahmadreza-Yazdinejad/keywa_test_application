import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:keywa_test_application/bloc/home_bloc.dart';
import 'package:keywa_test_application/data/datasource/crypto_list_datasource.dart';
import 'package:keywa_test_application/data/repository/crypto_list_repository.dart';

var locator = GetIt.instance;
void initLocator() {
  _component();
  _repository();
  _dataSource();
}

void _dataSource() {
  locator.registerFactory<ICryptoDataSoruce>(
    () => CryptoRemoteDataSource(
      locator.get(),
    ),
  );
}

void _repository() {
  locator.registerFactory<ICryptoRepository>(
    () => CryptoRemoteRepository(
      locator.get(),
    ),
  );
}

void _component() {
  locator.registerFactory<Dio>(
    () => Dio(
      BaseOptions(baseUrl: 'https://min-api.cryptocompare.com'),
    ),
  );

  locator.registerFactory<HomeBloc>(
    () => HomeBloc(
      locator.get(),
    ),
  );
}
