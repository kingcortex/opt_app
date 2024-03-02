import 'package:flutter/material.dart';

class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const FadeInUp({super.key, required this.child, required this.duration});

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0.0, 0.0))
            .animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child_) {
        return FadeTransition(
          opacity: opacityAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: widget.child,
          ),
        );
      },
    );
  }
}
