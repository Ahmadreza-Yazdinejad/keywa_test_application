import 'package:dartz/dartz.dart';
import 'package:keywa_test_application/data/model/crypto.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFetchDataState extends HomeState {
  final Either<String, List<Crypto>>? cryptoList;
  HomeFetchDataState({this.cryptoList});
}
