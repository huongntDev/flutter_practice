import 'package:flutter/material.dart';

import 'CounterViewModel.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  //final viewModel = CounterViewModel(); inject viewmodel

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: viewModel,
        builder: (context, listenable) {
          return Column(
            children: [
              if (viewModel.errorMessage != null)
                Text(
                  'Error: ${viewModel.errorMessage}',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.apply(color: Colors.red),
                ),
              Text('Count: ${viewModel.count}'),
              TextButton(
                onPressed: () {
                  viewModel.increment();
                },
                child: Text('Increment'),
              ),
            ],
          );
        });
  }
}
