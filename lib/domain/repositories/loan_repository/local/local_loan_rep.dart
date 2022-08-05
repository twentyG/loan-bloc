import 'package:loan_bloc/core/utils/utils.dart';
import 'package:loan_bloc/data/models/models.dart';
import 'package:loan_bloc/domain/repositories/loan_repository/repository.dart';

class LoanLocalRep extends LoanRepository {
  @override
  Future<LoanModel?> getLoans() async {
    var response = await storage?.getItem("loans");
    if (response != null) {
      return LoanModel.fromJson(response);
    }
    return null;
  }

  List<LoanModel> getMockedLoans() {
    return Utils.loanList;
  }
}
