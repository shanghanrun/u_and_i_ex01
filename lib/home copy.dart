import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime firstDay = DateTime.now();

  void onHeartPressed() {
    setState(() {
      firstDay = firstDay.subtract(const Duration(days: 1)); //날짜를 하루 줄이기
      // DateTime 타입의 firstDay는   firstDay-- 로 못한다.
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

  Container lowerContainer(BuildContext context) {
    return Container(
        // color: Colors.blue,
        child: Image.asset(
      'images/middle_image.png',
      height: MediaQuery.of(context).size.height / 2,
    ));
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
