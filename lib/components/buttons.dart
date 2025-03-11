import 'package:flutter/material.dart';
import 'package:weaver/theme.dart';

class FilledButtonStateless extends StatelessWidget {
  const FilledButtonStateless({
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
            color: primaryColor, borderRadius: BorderRadius.circular(50)),
        child: Text(
          buttonText,
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
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
            color: primaryColor, borderRadius: BorderRadius.circular(50)),
        child: widget.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
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
          style: secondaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
