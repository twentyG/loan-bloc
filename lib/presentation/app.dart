import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loan_bloc/core/colors/colors.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/local/local_loan_rep.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/remote/remote_loan_rep.dart';
import 'package:loan_bloc/presentation/loan/loan.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primarySwatchColor,
      ),
      home: BlocProvider<LoanCubit>(
        create: (context) => LoanCubit(
          remoteRep: GetIt.I<LoanRemoteRep>(),
          localRep: GetIt.I<LoanLocalRep>(),
        ),
        child: const MyLoansPage(),
      ),
    );
  }
}
