import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/counterProvider.dart';
import 'package:provider/provider.dart';
import "./screens/provider.dart";

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counter())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/name': (context) => HelloState(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(context.watch<Counter>().count.toString()),
                ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "/name"),
                    child: Text("Provider")),
                ElevatedButton(
                    onPressed: () => context.read<Counter>().increment(),
                    child: Text("Hello")),
                ElevatedButton(
                    onPressed: () => context.read<Counter>().decrement(),
                    child: Icon(Icons.remove)),
              ],
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
