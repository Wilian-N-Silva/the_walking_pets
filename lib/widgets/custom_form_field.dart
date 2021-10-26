import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customFormField(
    {required String label,
    TextEditingController? controller,
    bool? isObscure,
    bool? isReadOnly,
    String? hint,
    TextInputType? inputType,
    List<TextInputFormatter>? formatterList,
    String? value,
    TextInputAction? action,
    Function()? onTap,
    Function(String)? onChanged,
    Function(String)? onSubmited}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      keyboardType: inputType ?? TextInputType.name,
      obscureText: isObscure ?? false,
      initialValue: value,
      readOnly: isReadOnly ?? false,
      inputFormatters: formatterList,
      textInputAction: action,
      onFieldSubmitted: onSubmited,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
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
    ),
  );
}
