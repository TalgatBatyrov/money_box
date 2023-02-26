import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_box/blocs/money_cubit.dart';
import 'package:money_box/widgets/money_field.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final moneyCubit = MoneyCubit();
  final controller = TextEditingController();
  final _controller = TextEditingController();
  int allMoney = 0;

  @override
  void dispose() {
    moneyCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$allMoney'),
            const SizedBox(height: 10),
            BlocBuilder<MoneyCubit, int>(
              bloc: moneyCubit,
              builder: (context, state) => Text('$state'),
            ),
            MoneyField(controller: controller),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onEditingComplete: () {
                  allMoney = int.parse(_controller.text);
                  setState(() {});
                },
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'All money...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final money = int.parse(controller.text);

                moneyCubit.addMoney(money);
                setState(() {});
              },
              child: const Text('Ok'),
            )
          ],
        ),
      ),
    );
  }
}
