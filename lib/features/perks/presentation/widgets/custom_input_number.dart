import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputNumber extends StatelessWidget {
  final TextEditingController controller;
  final bool useDecimals;
  final String label;
  final String placeholder;
  const CustomInputNumber({
    super.key,
    required this.controller,
    this.useDecimals = false,
    required this.label,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value != null || value!.trim().isEmpty) {
          return 'Salario es requerido';
        }
        return null;
      },
      keyboardType: TextInputType.numberWithOptions(decimal: useDecimals),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: placeholder,
      ),
    );
  }
}
