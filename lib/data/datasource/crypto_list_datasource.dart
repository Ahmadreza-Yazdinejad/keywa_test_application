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
      var response = await _dio.get('');
      var res = response.data['data']
          .map<Crypto>((jsonMapObject) => Crypto.fromMapJson(jsonMapObject))
          .toList();
      return res;
    } on DioException catch (ex) {
      throw ApiException(
          errorMessage: ex.response?.data['message'],
          statusCode: ex.response?.statusCode);
    }
  }
}
