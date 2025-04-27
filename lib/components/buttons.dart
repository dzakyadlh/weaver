import 'package:flutter/material.dart';
import 'package:weaver/theme.dart';

class FilledButtonStateless extends StatelessWidget {
  const FilledButtonStateless({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.textSize = 16,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.only(bottom: 12),
  });

  final String buttonText;
  final VoidCallback onTap;
  final double textSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          buttonText,
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: textSize,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class FilledButtonStateful extends StatefulWidget {
  const FilledButtonStateful({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.isLoading,
  });

  final String buttonText;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  State<FilledButtonStateful> createState() => _FilledButtonStatefulState();
}

class _FilledButtonStatefulState extends State<FilledButtonStateful> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading ? null : widget.onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child:
            widget.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                  widget.buttonText,
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
      ),
    );
  }
}

class OutlinedButtonStateless extends StatelessWidget {
  const OutlinedButtonStateless({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          buttonText,
          style: secondaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
      ),
    );
  }
}

class SubIconButton extends StatelessWidget {
  const SubIconButton({
    super.key,
    required this.icon,
    required this.buttonText,
    required this.iconSize,
    required this.iconColor,
    required this.textSize,
    required this.onTap,
  });

  final IconData icon;
  final String buttonText;
  final double iconSize;
  final Color iconColor;
  final double textSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          const SizedBox(width: 8),
          Text(
            buttonText,
            style: subtitleTextStyle.copyWith(fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
