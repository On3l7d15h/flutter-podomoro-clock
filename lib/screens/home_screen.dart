import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pomodoro_clock/screens/ui/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //setting the app vars
  int time = 25;
  int breakTime = 5;
  Timer? timer;
  int counter =
      25 * 60; /* we will init the counter with study time in seconds */

  /* functions */
  void _startTime(int timeInMinutes) {
    counter = timeInMinutes * 60;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            counter--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: const Text("Pomodoro Clock"),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      /* setting the body of the app */
      body: Column(
          /* position */
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          /* differents elements into the column gadget */
          children: [
            Text(
              "${counter ~/ 60 < 10 ? "0" + (counter ~/ 60).toString() : counter ~/ 60}:${counter % 60 < 10 ? "0" + (counter % 60).toString() : counter % 60}",
              style: TextStyle(
                color: Colors.white,
                fontSize: max(120, MediaQuery.of(context).size.width / 8),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    //setting the start button...
                    setState(() {
                      if (timer != null) {
                        timer!.cancel();
                      }
                    });
                    _startTime(25);
                  },
                  fillColor: AppColor.secondaryColor,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 64.0,
                  ),
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                RawMaterialButton(
                  onPressed: () {
                    //setting the break button...
                    setState(() {
                      if (timer != null) {
                        timer!.cancel();
                      }
                    });
                    _startTime(5);
                  },
                  fillColor: AppColor.secondaryColor,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 64.0,
                  ),
                  child: const Text(
                    "Break",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
