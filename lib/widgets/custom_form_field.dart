import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget customFormField(
    {required String label,
    TextEditingController? controller,
    bool? isObscure,
    bool? isReadOnly,
    String? hint,
    TextInputType? inputType,
    List<TextInputFormatter>? formatterList,
    String? value}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      keyboardType: inputType ?? TextInputType.name,
      obscureText: isObscure ?? false,
      initialValue: value,
      readOnly: isReadOnly ?? false,
      inputFormatters: formatterList,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha o campo';
        }
        return null;
      },
      controller: controller,
    ),
  );
}
