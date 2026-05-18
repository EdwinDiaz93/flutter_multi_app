import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputNumber extends StatelessWidget {
  final TextEditingController controller;
  final bool useDecimals;
  final String label;
  final String placeholder;
  final IconData icon;
  const CustomInputNumber({
    super.key,
    required this.controller,
    this.useDecimals = false,
    required this.label,
    required this.placeholder,
    required this.icon,
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
        FilteringTextInputFormatter.allow(
          RegExp(useDecimals ? r'^\d*\.?\d{0,2}$' : r'^\d*$'),
        ),
      ],
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: placeholder,
      ),
    );
  }
}
