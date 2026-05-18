import 'package:flutter/material.dart';
import 'package:multi_app/features/perks/domain/entities/entities.dart';

class DropdownField extends StatefulWidget {
  final Function(String?)? onChanged;
  final List<DropdownOptions> options;
  const DropdownField({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    String? option = widget.options.first.value;
    final colors = Theme.of(context).colorScheme;
    return DropdownButtonFormField(
      icon: Icon(Icons.arrow_downward),
      elevation: 16,
      isExpanded: true,
      initialValue: option,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Tiempo Trabajado",
      ),
      padding: EdgeInsetsDirectional.all(5),
      enableFeedback: true,
      style: TextStyle(color: colors.primary),

      onChanged: widget.onChanged,

      items: widget.options
          .map(
            (option) => DropdownMenuItem<String>(
              value: option.value,
              child: Text(option.label),
            ),
          )
          .toList(),
    );
  }
}
