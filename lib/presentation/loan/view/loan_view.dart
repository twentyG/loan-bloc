import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_bloc/data/models/models.dart';
import 'package:loan_bloc/presentation/loan/loan.dart';
import 'package:loan_bloc/presentation/loan/widgets/loan_expansion_calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class MyLoansPage extends StatefulWidget {
  const MyLoansPage({Key? key}) : super(key: key);

  @override
  State<MyLoansPage> createState() => _MyLoansPageState();
}

class _MyLoansPageState extends State<MyLoansPage> {
  @override
  void initState() {
    super.initState();
    context.read<LoanCubit>().fetchLoans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My loans"),
        ),
      ),
      body: BlocBuilder<LoanCubit, LoanState>(
        builder: (context, state) {
          return blocBody(state);
        },
      ),
    );
  }

  Widget blocBody(LoanState state) {
    if (state is LoanLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is LoansFetchedSuccess) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) =>
                expandOnlyOneItem(index, isExpanded, state.loans),
            children: state.loans.map<ExpansionPanel>((LoanModel item) {
              return LoanExpansionCalendar(
                isExpanded: item.isExpanded,
                loan: item,
              );
            }).toList(),
          ),
        ),
      );
    } else if (state is LoansFetchingError) {
      return Center(child: Text(state.errorMessage ?? ""));
    }
    return const SizedBox();
  }

  expandOnlyOneItem(int index, bool isExpanded, List<LoanModel> loanList) {
    if (isExpanded == false) {
      for (final item in loanList) {
        if (loanList[index] != item) {
          setState(() {
            item.isExpanded = true;
          });
        }
        setState(() {
          item.isExpanded = false;
        });
      }
    }
    setState(() {
      loanList[index].isExpanded = !isExpanded;
    });
  }
}
