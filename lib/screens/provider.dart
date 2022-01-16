import 'package:flutter/material.dart';
import '../providers/counterProvider.dart';
import 'package:provider/provider.dart';

class HelloState extends StatelessWidget {
  const HelloState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<Counter>().count.toString()),
      ),
      body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => context.read<Counter>().increment(),
                child: Text("Click me")),
          ],
        ),
      )),
    );
  }
}
