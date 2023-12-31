import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime firstDay = DateTime.now().subtract(const Duration(minutes: 30));

  void onHeartPressed() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white.withOpacity(0.8),
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                maximumDate: DateTime.now()
                    .add(const Duration(minutes: 1)), //오늘까지만 선택가능 = 미래는 선택못함.
                onDateTimeChanged: (date) {
                  setState(() {
                    firstDay = date;
                  });
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            upperContainer(textTheme),
            lowerContainer(context),
          ],
        ),
      ),
    );
  }

  Widget lowerContainer(BuildContext context) {
    return Expanded(
      // 혹시 overflow발생하지 않도록
      child: Container(
          // color: Colors.blue,
          child: Image.asset(
        'images/middle_image.png',
        height: MediaQuery.of(context).size.height / 2,
      )),
    );
  }

  Container upperContainer(TextTheme textTheme) {
    return Container(
      // color: Colors.amber,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text('You & I', style: textTheme.displayLarge),
          const SizedBox(height: 16),
          Text('우리 처음 만난 날', style: textTheme.bodyLarge),
          const SizedBox(height: 16),
          Text('${firstDay.year}.${firstDay.month}.${firstDay.day}',
              style: textTheme.bodyMedium),
          IconButton(
            icon: const Icon(Icons.favorite),
            iconSize: 80,
            color: Colors.red,
            onPressed: onHeartPressed,
          ),
          Text('D+${DateTime.now().difference(firstDay).inDays + 1}',
              style: textTheme.displayMedium),
        ],
      ),
    );
  }
}
