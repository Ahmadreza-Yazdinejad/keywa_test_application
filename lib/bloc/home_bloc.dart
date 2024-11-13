import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keywa_test_application/bloc/home_event.dart';
import 'package:keywa_test_application/bloc/home_state.dart';
import 'package:keywa_test_application/data/repository/crypto_list_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ICryptoRepository _repository;
  HomeBloc(this._repository) : super(HomeInitial()) {
    on<HomeFetchDateEvent>(
      (event, emit) async {
        emit(HomeLoading());
        var cryptoList = await _repository.cryptoList();
        emit(
          HomeFetchDataState(cryptoList: cryptoList),
        );
      },
    );
  }
}
