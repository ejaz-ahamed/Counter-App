import 'package:counter_app/controller/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DecrementCount extends StatefulWidget {
  const DecrementCount({super.key});

  @override
  State<DecrementCount> createState() => _DecrementCountState();
}

class _DecrementCountState extends State<DecrementCount> {
  int count = 0;

  @override
  void initState() {
    getCount();

    super.initState();
  }

  Future<void> getCount() async {
    Counter.getCount().then((value) {
      setState(() {
        count = value;
      });
    });
  }

  Future<void> decrementCount() async {
    await Counter.setCount(count - 1);
    getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decrement Count"),
        toolbarHeight: 80,
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 50,
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => decrementCount(),
        child: const Icon(Icons.remove),
      ),
    );
  }
}
