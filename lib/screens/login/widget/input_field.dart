import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? errMsg;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    required this.errMsg,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final isPassword = widget.label.toLowerCase() == 'password';
    return Column(
      children: [
        Row(
          children: [
            Text(widget.label),
            Text("*", style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: isPassword ? _obscureText : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            errorText: widget.errMsg,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
