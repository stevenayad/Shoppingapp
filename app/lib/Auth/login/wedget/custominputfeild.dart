import 'package:flutter/material.dart';

class Inputextfield extends StatefulWidget {
  const Inputextfield({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.isactive = false,
    this.isappear = false,
  });

  final bool isactive;
  final bool isappear;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  _InputextfieldState createState() => _InputextfieldState();
}

class _InputextfieldState extends State<Inputextfield> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isactive;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: widget.isappear
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : null,
          hintText: widget.hint,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          fillColor: const Color(0xFFAAAAAA),
          filled: true,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
        validator: widget.validator,
        controller: widget.controller,
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Color(0xFFFAFAFA)),
  );
}
