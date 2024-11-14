import 'package:dio/dio.dart';
import 'package:keywa_test_application/data/model/crypto.dart';
import 'package:keywa_test_application/utility/Errors/api_exception.dart';

abstract class ICryptoDataSoruce {
  Future<List<Crypto>> cryptoList();
}

class CryptoRemoteDataSource extends ICryptoDataSoruce {
  final Dio _dio;
  CryptoRemoteDataSource(this._dio);
  @override
  Future<List<Crypto>> cryptoList() async {
    try {
      var response = await _dio.get('/data/top/mktcapfull?limit=10&tsym=USD');
      final cryptoList = response.data['Data']
          .map<Crypto>((data) => Crypto.fromJson(data))
          .toList();
      return cryptoList;
    } on DioException catch (ex) {
      throw ApiException(
          errorMessage: ex.response?.data['message'],
          statusCode: ex.response?.statusCode);
    }
  }
}
