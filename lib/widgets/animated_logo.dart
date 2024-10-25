import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AnimatedLogo extends StatefulWidget {

  const AnimatedLogo({super.key});

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.3,
      end: 1.3,
    ).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _animation!,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animation!.value,
          child: SvgPicture.asset(
                  'assets/logos/logo.svg',
                  height: 40,
                  width: 40,
                  color: Colors.white
                ),
        );
      },
    );
  }
}
