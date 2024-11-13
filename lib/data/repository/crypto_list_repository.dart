import 'package:dartz/dartz.dart';
import 'package:keywa_test_application/data/datasource/crypto_list_datasource.dart';
import 'package:keywa_test_application/data/model/crypto.dart';
import 'package:keywa_test_application/utility/Errors/api_exception.dart';

abstract class ICryptoRepository {
  Future<Either<String, List<Crypto>>> cryptoList();
}

class CryptoRemoteRepository extends ICryptoRepository {
  final ICryptoDataSoruce _dataSoruce;
  CryptoRemoteRepository(this._dataSoruce);

  @override
  Future<Either<String, List<Crypto>>> cryptoList() async {
    try {
      var response = await _dataSoruce.cryptoList();

      return right(response);
    } on ApiException {
      return left('un known Error');
    }
  }
}
