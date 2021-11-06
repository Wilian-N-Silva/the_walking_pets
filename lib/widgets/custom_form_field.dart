import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget CustomFormField(
//     {required String label,
//     TextEditingController? controller,
//     bool? isObscure,
//     bool? isReadOnly,
//     String? hint,
//     TextInputType? inputType,
//     List<TextInputFormatter>? formatterList,
//     String? value,
//     TextInputAction? action,
//     Function()? onTap,
//     Function(String)? onChanged,
//     Function(String)? onSubmited}) {
//   return TextFormField(
//     keyboardType: inputType ?? TextInputType.name,
//     obscureText: isObscure ?? false,
//     initialValue: value,
//     readOnly: isReadOnly ?? false,
//     inputFormatters: formatterList,
//     textInputAction: action,
//     onFieldSubmitted: onSubmited,
//     controller: controller,
//     onTap: onTap,
//     onChanged: onChanged,
//     decoration: InputDecoration(
//       label: Text(
//         label,
//         style: const TextStyle(
//           fontSize: 16.0,
//         ),
//       ),
//       // constraints: const BoxConstraints(minHeight: 64.0, maxHeight: 64.0),
//       border: const OutlineInputBorder(),
//       hintText: hint,
//       // isDense: true,
//       contentPadding: const EdgeInsets.all(22.5),
//     ),
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return 'Por favor, preencha o campo';
//       }
//       return null;
//     },
//   );
// }
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
    this.isOptional,
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
  final bool? isOptional;

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
            '${widget.label}${widget.isOptional != null ? widget.isOptional! ? ' (Opcional)' : '' : ''}',
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
          if (widget.isOptional == null ||
              widget.isOptional == true && value == null ||
              value!.isEmpty) {
            return 'Por favor, preencha o campo';
          }
          return null;
        },
      ),
    );
  }
}
