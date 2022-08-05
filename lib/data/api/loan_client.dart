import 'package:dio/dio.dart';
import 'package:loan_bloc/data/models/models.dart';
import 'package:retrofit/http.dart';

part 'loan_client.g.dart';

@RestApi(baseUrl: 'https://identification.cbk.kg/api/')
abstract class LoanClient {
  factory LoanClient(Dio dio, {String? baseUrl}) = _LoanClient;

  @GET("test_task")
  Future<LoanModel> getLoans();
}
