import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../gen/assets.gen.dart';

class CenterWidget extends StatefulWidget {
  const CenterWidget({
    required this.image,
    required this.husbandName,
    required this.wifeName,
    this.husbandTextAlign = Alignment.center,
    this.wifeTextAlign = Alignment.center,
    this.topSpaceWidget,
    this.bottomSpaceWidget,
    this.fontName = 'GreatVibes',
    this.color = AppColors.yellowTemplateColor,
    this.padding = 20,
    super.key,
  });

  final AssetGenImage image;
  final String husbandName;
  final String wifeName;
  final Alignment? husbandTextAlign;
  final Alignment? wifeTextAlign;
  final Widget? topSpaceWidget;
  final Widget? bottomSpaceWidget;
  final String? fontName;
  final Color? color;
  final double? padding;

  @override
  // ignore: library_private_types_in_public_api
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

    _controller.forward();
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
                  Image.asset(
                    widget.image.path,
                    width: context.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: widget.padding!),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (widget.topSpaceWidget.isNotNull) widget.topSpaceWidget!,
                        Align(
                          alignment: widget.husbandTextAlign!,
                          child: Text(
                            widget.husbandName,
                            maxLines: 1,
                            style: context.textTheme.displayMedium?.copyWith(
                              color: widget.color,
                              fontFamily: widget.fontName,
                            ),
                          ),
                        ),
                        Text(
                          '&',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: context.textTheme.displayMedium?.copyWith(
                            color: widget.color,
                            fontFamily: 'GreatVibes',
                          ),
                        ),
                        Align(
                          alignment: widget.wifeTextAlign!,
                          child: Text(
                            widget.wifeName,
                            maxLines: 1,
                            style: context.textTheme.displayMedium?.copyWith(
                              color: widget.color,
                              fontFamily: widget.fontName,
                            ),
                          ),
                        ),
                        if (widget.bottomSpaceWidget.isNotNull) widget.bottomSpaceWidget!,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
