import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _dotOne;
  late Animation<double> _dotTwo;
  late Animation<double> _dotThree;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _dotOne = Tween<double>(begin: 0, end: -4).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.3)),
    );
    _dotTwo = Tween<double>(begin: 0, end: -4).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.5)),
    );
    _dotThree = Tween<double>(begin: 0, end: -4).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.7)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder:
          (context, child) => Transform.translate(
            offset: Offset(0, animation.value),
            child: child,
          ),
      child: const CircleAvatar(radius: 4, backgroundColor: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildDot(_dotOne),
        SizedBox(width: 6.w),
        _buildDot(_dotTwo),
        SizedBox(width: 6.w),
        _buildDot(_dotThree),
      ],
    );
  }
}
