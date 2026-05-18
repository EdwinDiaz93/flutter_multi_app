import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputNumber extends StatelessWidget {
  final TextEditingController controller;

  const CustomInputNumber({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,

      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        label: Text('Salario'),
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: '1000',
      ),
    );
  }
}
