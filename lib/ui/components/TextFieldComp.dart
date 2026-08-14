import 'package:flutter/material.dart';

class TextFieldComp extends StatefulWidget {
  const TextFieldComp({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.isPassword = false,
    this.errorText = '',
  });

  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? errorText;

  @override
  State<TextFieldComp> createState() => _TextFieldCompState();
}

class _TextFieldCompState extends State<TextFieldComp> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _obscured,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 1.5,
          ),
        ),
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
          onPressed: () => setState(() => _obscured = !_obscured),
        )
            : null,
      ),
    );
  }
}