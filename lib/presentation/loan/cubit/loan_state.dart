part of 'loan_cubit.dart';

@immutable
abstract class LoanState {
  final List<LoanModel> loans;

  const LoanState({this.loans = const []});
}

class LoanInitial extends LoanState {
  const LoanInitial({super.loans});
}

class LoanLoading extends LoanState {
  const LoanLoading({super.loans});
}

class LoansFetchedSuccess extends LoanState {
  const LoansFetchedSuccess({super.loans});
}

class LoansFetchingError extends LoanState {
  final String? errorMessage;

  const LoansFetchingError({this.errorMessage});
}
