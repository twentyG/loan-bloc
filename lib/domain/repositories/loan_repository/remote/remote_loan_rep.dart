import 'package:loan_bloc/data/models/models.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/repository.dart';

class LoanRemoteRep extends LoanRepository {
  @override
  Future<LoanModel?> getLoans() async {
    var loan = await client.getLoans();
    await storage?.setItem("loans", loan.toJson());
    return loan;
  }
}
