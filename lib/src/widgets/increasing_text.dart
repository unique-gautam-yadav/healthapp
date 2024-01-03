import 'package:flutter/material.dart';

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
