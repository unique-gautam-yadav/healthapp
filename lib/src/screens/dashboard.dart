import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/animations/fade_in.dart';
import 'package:health_app/src/screens/profile.dart';
import 'package:iconsax/iconsax.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.sizeOf(context).width / 2) - 35;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            FadeInAnimation(
              delay: 1,
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tue, 2 Jan",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "My Day",
                        style: TextStyle(fontSize: 34),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onLongPress: () {
                      log('triggered');
                      setState(() {});
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const ProfilePage(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Hero(
                        tag: const Key('image'),
                        child: Container(
                          decoration: const ShapeDecoration(
                            shape: StarBorder(
                              innerRadiusRatio: .9,
                              pointRounding: .2,
                              points: 10,
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/model.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInAnimation(
                        delay: 1.5,
                        child: AppCard(
                          height: 250,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Walk",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      'assets/icons/footprints.png',
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: ProgressWithText(
                                  value: 2232,
                                  indicatorValue: .78,
                                  title: 'steps',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInAnimation(
                        delay: 2,
                        child: AppCard(
                          height: w,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Sleep",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Iconsax.moon,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IncreasingText(
                                      7.21,
                                      isSingle: false,
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    Text(
                                      "hours",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInAnimation(
                        delay: 2.5,
                        child: AppCard(
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text("Water"),
                                  const Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      'assets/icons/waterdrop.png',
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/glass-of-water.png',
                                    height: 50,
                                  ),
                                ),
                              ),
                              const IncreasingText(
                                2,
                                isSingle: true,
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              const Text(
                                "bottles",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: w,
                  child: Column(
                    children: [
                      FadeInAnimation(
                        delay: 1.5,
                        child: AppCard(
                          height: 300,
                          color: Colors.deepPurple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Heart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Iconsax.heart, color: Colors.white),
                                ],
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/images/graph.png',
                                  color: Colors.white,
                                ),
                              ),
                              const IncreasingText(
                                98,
                                isSingle: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  height: .9,
                                ),
                              ),
                              const Text(
                                "bmp",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInAnimation(
                        delay: 2,
                        child: AppCard(
                          height: 225,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Calories",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      'assets/icons/thunderbolt.png',
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: ProgressWithText(
                                  indicatorValue: .78,
                                  title: 'kcal',
                                  value: 553,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const FadeInAnimation(
                        delay: 2.5,
                        child: AppCard(
                          height: 155,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Gym",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Iconsax.speedometer5,
                                    color: Colors.deepPurple,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                "0",
                                style: TextStyle(fontSize: 32),
                              ),
                              Text(
                                "min",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class ProgressWithText extends StatefulWidget {
  const ProgressWithText({
    super.key,
    required this.indicatorValue,
    required this.title,
    required this.value,
  });

  final double indicatorValue;
  final String title;
  final int value;

  @override
  State<ProgressWithText> createState() => _ProgressWithTextState();
}

class _ProgressWithTextState extends State<ProgressWithText>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? valueAnimation;
  Animation<double>? indicatorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    valueAnimation =
        Tween<double>(begin: 0, end: widget.value * 1).animate(_controller!)
          ..addListener(() {
            setState(() {});
          });
    indicatorAnimation = Tween<double>(begin: 0, end: widget.indicatorValue)
        .animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => _controller!.forward(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.sizeOf(context).width / 2) - 35;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${valueAnimation?.value ?? 0}".split('.')[0],
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox.square(
            dimension: w - 80,
            child: RotatedBox(
              quarterTurns: 3,
              child: CircularProgressIndicator(
                color: Colors.deepPurple.shade400,
                strokeCap: StrokeCap.round,
                strokeWidth: 10,
                value: indicatorAnimation?.value ?? 0,
                backgroundColor: Colors.deepPurple.withOpacity(.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    required this.height,
    this.color,
  });

  final Widget child;
  final double height;
  final MaterialColor? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height,
      decoration: BoxDecoration(
        color: color != null ? null : Colors.white,
        gradient: color == null
            ? null
            : LinearGradient(colors: [color!.shade300, color!.shade500]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 60,
          ),
        ],
      ),
      child: child,
    );
  }
}

class IncreasingText extends StatefulWidget {
  const IncreasingText(
    this.value, {
    super.key,
    required this.isSingle,
    required this.style,
    this.suffix,
  });

  @override
  State<IncreasingText> createState() => _IncreasingTextState();
  final double value;
  final bool isSingle;
  final TextStyle style;
  final String? suffix;
}

class _IncreasingTextState extends State<IncreasingText>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    animation = Tween<double>(begin: 0, end: widget.value).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => _controller!.forward(),
      );
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      animation == null
          ? "0"
          : animation!.value.toStringAsFixed(widget.isSingle ? 0 : 2) +
              (widget.suffix ?? ""),
      style: widget.style,
    );
  }
}
