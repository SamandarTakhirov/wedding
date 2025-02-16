import 'package:flutter/material.dart';

import '../../../core/utils/context_utils.dart';

class CenterWidget extends StatefulWidget {
  const CenterWidget({
    required this.child,
    required this.husbandName,
    required this.wifeName,
    super.key,
  });

  final Widget child;
  final String husbandName;
  final String wifeName;

  @override
  _CenterWidgetState createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward(); // Animatsiyani boshlash
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  widget.child, // Rasm
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        '${widget.husbandName}\n&\n${widget.wifeName}',
                        textAlign: TextAlign.center,
                        style: context.textTheme.displayMedium?.copyWith(
                          color: const Color(0xFF966737),
                          fontFamily: 'GreatVibes',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
