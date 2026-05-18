import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_app/config/dependency/dependency_injection.dart';
import 'package:multi_app/features/perks/domain/entities/entities.dart';
import 'package:multi_app/features/perks/presentation/bloc/perks_bloc.dart';

import 'package:multi_app/features/perks/presentation/widgets/widgets.dart';

class PerksScreen extends StatelessWidget {
  const PerksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prestaciones")),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<PerksBloc>(),
          child: _PerksView(),
        ),
      ),
    );
  }
}

class _PerksView extends StatefulWidget {
  @override
  State<_PerksView> createState() => _PerksViewState();
}

class _PerksViewState extends State<_PerksView> {
  final salaryController = TextEditingController();
  String workedTime = '0';
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
          CustomInputNumber(
            controller: salaryController,
            useDecimals: true,
            label: 'Salario',
            placeholder: "1000",
          ),
          SizedBox(height: 15),
          DropdownField(
            onChanged: (value) {
              setState(() {
                workedTime = value!;
              });
            },
            options: [
              DropdownOptions(label: 'Menos de 1 año', value: '0'),
              DropdownOptions(label: ' de 1 a 3 años', value: '1'),
              DropdownOptions(label: ' de 3 a 10 años', value: '3'),
              DropdownOptions(label: ' 10 o mas años', value: '10'),
            ],
          ),
          SizedBox(height: 15),
          if (workedTime == '0')
            CustomInputNumber(
              controller: salaryController,
              useDecimals: false,
              label: 'meses',
              placeholder: '1-11',
            ),
          PerksList(
            titleStyle: titleStyle,
            discountStyle: discountStyle,
            liquidStyle: liquidStyle,
          ),

          FilledButton(
            onPressed: () {
              context.read<PerksBloc>().add(
                LoadPerksEvent(
                  salary: Salary(
                    salary: salaryController.text,
                    workedTime: workedTime,
                  ),
                ),
              );
            },
            child: Text("Calcular"),
          ),
        ],
      ),
    );
  }
}

class PerksList extends StatelessWidget {
  const PerksList({
    super.key,
    required this.titleStyle,
    required this.discountStyle,
    required this.liquidStyle,
  });

  final TextStyle titleStyle;
  final TextStyle discountStyle;
  final TextStyle liquidStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerksBloc, PerksState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(flex: 2, child: Text('AFP', style: titleStyle)),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '-\$${state.perk.afp}',
                            style: discountStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('AFP Patronal', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '-\$${state.perk.afpPatronal}',
                            style: discountStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(flex: 2, child: Text('ISSS', style: titleStyle)),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '-\$${state.perk.isss}',
                            style: discountStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('ISSS Patronal', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '-\$${state.perk.isssPatronal}',
                            style: discountStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Renta', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '-\$${state.perk.renta}',
                            style: discountStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Descuentos Totales', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '-\$${state.perk.descuentosTotales}',
                            style: discountStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Vacaciones', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '\$${state.perk.vacaciones}',
                            style: liquidStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Aguinaldo Estimado', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '\$${state.perk.aguinaldo}',
                            style: liquidStyle,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Salario Final', style: titleStyle),
                      ),
                      if (state is LoadingPerks)
                        SpinPerfect(
                          infinite: true,
                          child: Icon(Icons.monetization_on),
                        ),
                      if (state is LoadedPerks)
                        Expanded(
                          child: Text(
                            '\$${state.perk.salarioLiquido}',
                            style: liquidStyle,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
