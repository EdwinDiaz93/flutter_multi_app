import 'package:flutter/material.dart';

import 'package:multi_app/features/perks/presentation/widgets/widgets.dart';

class PerksScreen extends StatelessWidget {
  const PerksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prestaciones")),
      body: SafeArea(child: _PerksView()),
    );
  }
}

class _PerksView extends StatelessWidget {
  final salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final TextStyle titleStyle = TextStyle(
      fontSize: 18,
      color: colors.primary,
      fontWeight: FontWeight.bold,
    );

    final TextStyle discountStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.red[700],
    );

    final TextStyle liquidStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.green[400],
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomInputNumber(controller: salaryController),
          SizedBox(height: 5),
          CustomInputNumber(controller: salaryController),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('AFP', style: titleStyle)),
                      Expanded(child: Text('-\$145.00', style: discountStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('AFP Patronal', style: titleStyle)),
                      Expanded(child: Text('-\$175.00', style: discountStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('ISSS', style: titleStyle)),
                      Expanded(child: Text('-\$30.00', style: discountStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('ISSS Patronal', style: titleStyle)),
                      Expanded(child: Text('-\$75.00', style: discountStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Renta', style: titleStyle)),
                      Expanded(child: Text('-\$245.95', style: discountStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Descuentos Totales', style: titleStyle),
                      ),
                      Expanded(child: Text('-\$420.95', style: discountStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Vacaciones', style: titleStyle)),
                      Expanded(child: Text('\$157.90', style: liquidStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Aguinaldo Estimado', style: titleStyle),
                      ),
                      Expanded(child: Text('\$1579.05', style: liquidStyle)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Salario Final', style: titleStyle)),
                      Expanded(child: Text('\$1579.05', style: liquidStyle)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          FilledButton(onPressed: () {}, child: Text("Calcular")),
        ],
      ),
    );
  }
}
