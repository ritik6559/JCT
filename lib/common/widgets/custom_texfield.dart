import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool isPasswordType;

  @override
  void initState() {
    super.initState();
    isPasswordType = widget.obscureText;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPasswordType,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordType = !isPasswordType;
                  });
                },
                icon: Icon(
                  isPasswordType ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white),
        labelText: widget.hintText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        errorStyle: const TextStyle(fontSize: 18.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(9.0),
          ),
        ),
      ),
    );
  }
}
