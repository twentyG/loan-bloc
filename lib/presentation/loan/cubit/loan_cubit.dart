import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_bloc/data/models/models.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/local/local_loan_rep.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/remote/remote_loan_rep.dart';

part 'loan_state.dart';

class LoanCubit extends Cubit<LoanState> {
  LoanCubit({required this.remoteRep, required this.localRep})
      : super(const LoanInitial());

  final LoanRemoteRep remoteRep;
  final LoanLocalRep localRep;

  void fetchLoans() async {
    emit(const LoanLoading());

    emit(LoansFetchedSuccess(loans: localRep.getMockedLoans()));

    var localLoan = await localRep.getLoans();
    if (localLoan != null) {
      emit(LoansFetchedSuccess(loans: [...state.loans, localLoan]));
    }
    try {
      final remoteLoan = await remoteRep.getLoans();
      if (remoteLoan != null) {
        emit(LoansFetchedSuccess(loans: [...state.loans, remoteLoan]));
      }
    } on DioError catch (e) {
      // TODO
    } catch (e) {
      emit(const LoansFetchingError(errorMessage: "Something went wrong!"));
    }
  }
}
