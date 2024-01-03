import 'package:flutter/material.dart';

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
