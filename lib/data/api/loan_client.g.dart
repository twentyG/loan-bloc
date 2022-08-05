// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _LoanClient implements LoanClient {
  _LoanClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://identification.cbk.kg/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoanModel> getLoans() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoanModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'test_task',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoanModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
