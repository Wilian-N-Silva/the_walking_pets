import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.label,
    required this.selected,
    required this.items,
    required this.handler,
    this.isRequired,
  }) : super(key: key);

  final String label;
  final String? selected;
  final bool? isRequired;
  final List<String> items;

  final Function(String?) handler;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? sel;

  @override
  void initState() {
    super.initState();
    sel = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField(
          value: sel,
          isDense: true,
          validator: (value) {
            if ((widget.isRequired == null || widget.isRequired == true) &&
                value == null) {
              return 'Por favor, preencha o campo';
            }
            return null;
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText:
                '${widget.label}${widget.isRequired != null ? widget.isRequired! ? ' (Opcional)' : '' : ''}',
          ),
          items: widget.items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: (String? value) {
            setState(() {
              sel = value;
              widget.handler(value);
            });
          }),
    );
  }
}
