import 'package:flutter/material.dart';
import 'package:home_services/utils/push.dart';
import 'package:home_services/views/payment_view.dart';
import 'package:home_services/widgets/app_txt.dart';
import 'package:home_services/widgets/btn.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  int _firstDay = 1;
  int _focusedDay = 1;
  //
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(_firstDay),
      focusedDay: DateTime(_focusedDay),
      lastDay: DateTime(DateTime.now().year),
      onDaySelected: (selectedDay, focusedDay) {
        debugPrint('selectedDay = $selectedDay');
        _firstDay = selectedDay.day;
        _focusedDay = focusedDay.day;
        setState(() {});
      },
      headerStyle: const HeaderStyle(
        formatButtonVisible: true,
        titleTextStyle: TextStyle(color: Colors.pink, fontSize: 16),
        leftChevronIcon: Icon(
          Icons.arrow_back_ios,
          color: Colors.pink,
          size: 15,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.pink,
          size: 15,
        ),
        leftChevronMargin: EdgeInsets.only(left: 70),
        rightChevronMargin: EdgeInsets.only(right: 70),
      ),
      calendarStyle: const CalendarStyle(
          // weekendStyle: TextStyle(color: Colors.pink),
          // weekdayStyle: TextStyle(color: Colors.pink),
          ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.pink),
        weekdayStyle: TextStyle(color: Colors.pink),
      ),
    );
    return Column(
      children: [
        Expanded(
          child: TableCalendar(
            firstDay: DateTime(_firstDay),
            focusedDay: DateTime(_focusedDay),
            lastDay: DateTime(DateTime.now().year),
            onDaySelected: (selectedDay, focusedDay) {
              debugPrint('selectedDay = $selectedDay');
              _firstDay = selectedDay.day;
              _focusedDay = focusedDay.day;
              setState(() {});
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: true,
              titleTextStyle: TextStyle(color: Colors.pink, fontSize: 16),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.pink,
                size: 15,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink,
                size: 15,
              ),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: const CalendarStyle(
                // weekendStyle: TextStyle(color: Colors.pink),
                // weekdayStyle: TextStyle(color: Colors.pink),
                ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.pink),
              weekdayStyle: TextStyle(color: Colors.pink),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: Btn(
            child: const AppTxt('go next'),
            onPressed: () {
              Push.to(context, const PaymentView());
            },
          ),
        ),
        const Expanded(
          flex: 4,
          child: SizedBox(),
        ),
      ],
    );
  }
}
