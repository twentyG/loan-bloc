import 'package:get_it/get_it.dart';
import 'package:loan_bloc/data/api/loan_client.dart';
import 'package:loan_bloc/data/models/models.dart';
import 'package:loan_bloc/domain/repositories/base_repository.dart';
import 'package:localstorage/localstorage.dart';

abstract class LoanRepository extends BaseRepository {
  late LoanClient _client;

  LoanClient get client => _client;

  LoanRepository({LoanClient? client, LocalStorage? storage})
      : super(storage: storage) {
    if (client != null) {
      _client = client;
    } else {
      _client = GetIt.I<LoanClient>();
    }
  }

  Future<LoanModel?> getLoans();
}
