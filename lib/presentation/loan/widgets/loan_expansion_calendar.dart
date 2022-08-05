import 'package:flutter/material.dart';
import 'package:loan_bloc/core/colors/colors.dart';
import 'package:loan_bloc/core/extensions/date.dart';
import 'package:loan_bloc/data/models/models.dart';
import 'package:table_calendar/table_calendar.dart';

class LoanExpansionCalendar extends ExpansionPanel {
  LoanExpansionCalendar({
    Key? key,
    required bool isExpanded,
    required LoanModel loan,
  }) : super(
          isExpanded: isExpanded,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Amount: ${loan.amount}'),
                  Text('Currency: ${loan.currency}'),
                ],
              ),
              TableCalendar(
                firstDay: loan.take_date ?? DateTime.now(),
                lastDay: loan.paymentDays.last,
                focusedDay: DateTime.now(),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: const CalendarStyle(
                  weekendTextStyle: TextStyle(color: Colors.red),
                  markerDecoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(color: mainColor),
                  weekendStyle: TextStyle(
                    color: Colors.red.shade500,
                  ),
                ),
                eventLoader: (day) {
                  return loan.paymentDays
                      .where((pD) => pD.isSameDay(day))
                      .toList();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  child: ListTile(
                    title: const Text("В этом месяце вам нужно оплатить: ",
                        style: TextStyle(fontSize: 14)),
                    subtitle: const Text(
                        "В случае просрочек ваша кредитная история может пострадать",
                        style: TextStyle(fontSize: 12)),
                    trailing: Text(
                      '${loan.monthPayment.toStringAsFixed(2)} ${loan.currency!}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(loan.product_name ?? ""),
              subtitle: Text('Take date: ${loan.take_date?.toFormattedString()}'),
            );
          },
          canTapOnHeader: true,
        );
}
