import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    required this.label,
    this.controller,
    this.isObscure,
    this.isReadOnly,
    this.hint,
    this.inputType,
    this.formatterList,
    this.value,
    this.action,
    this.onTap,
    this.onChanged,
    this.onSubmited,
    this.isRequired,
    this.useOptionalLabel,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final bool? isObscure;
  final bool? isReadOnly;
  final String? hint;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formatterList;
  final String? value;
  final TextInputAction? action;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmited;
  final bool? isRequired;
  final bool? useOptionalLabel;

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: widget.inputType ?? TextInputType.name,
        obscureText: widget.isObscure ?? false,
        initialValue: widget.value,
        readOnly: widget.isReadOnly ?? false,
        inputFormatters: widget.formatterList,
        textInputAction: widget.action,
        onFieldSubmitted: widget.onSubmited,
        controller: widget.controller,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          label: Text(
            '${widget.label}${widget.useOptionalLabel != null ? widget.useOptionalLabel! ? ' (Opcional)' : '' : ''}',
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          border: const OutlineInputBorder(),
          hintText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 22.5,
            horizontal: 12.0,
          ),
        ),
        validator: (value) {
          if ((widget.isRequired == null || widget.isRequired == true) &&
              value!.isEmpty) {
            return 'Por favor, preencha o campo';
          }
          return null;
        },
      ),
    );
  }
}
