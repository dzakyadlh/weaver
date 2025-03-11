import 'package:flutter/material.dart';
import 'package:weaver/theme.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.isObscurable,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isObscurable;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isObscured,
        validator: widget.validator,
        style: primaryTextStyle,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          labelText: widget.label,
          labelStyle: secondaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semibold,
          ),
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isObscurable
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility),
                )
              : null,
        ),
      ),
    );
  }
}
