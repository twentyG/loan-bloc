import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loan_bloc/data/api/loan_client.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/local/local_loan_rep.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/remote/remote_loan_rep.dart';
import 'package:loan_bloc/presentation/app.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  dependencyInjects();
  runApp(const MyApp());
}

void dependencyInjects() {
  var dio = Dio();
  GetIt.I.registerSingleton<Dio>(dio);
  GetIt.I.registerSingleton<LocalStorage>(LocalStorage('test_loan_app'));
  GetIt.I.registerSingleton<LoanClient>(LoanClient(dio));
  GetIt.I.registerSingleton<LoanRemoteRep>(LoanRemoteRep());
  GetIt.I.registerSingleton<LoanLocalRep>(LoanLocalRep());
}
