import 'package:flutter/material.dart';
import 'package:shop/src/providers/couter.dart';


class CounterPage extends StatefulWidget {

    const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
  final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo contador'),
      ),
      body: Column(
        children: [
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
            onPressed:(){
              setState(() {
                provider?.state.incremento();
              });
              
              print(CounterProvider.of(context)?.state.value);
            },
            icon:Icon(Icons.add)
            ),

            IconButton(
            onPressed:(){
              setState(() {
                provider?.state.decremento();
              });
              
              print(CounterProvider.of(context)?.state.value);
            },
            icon:Icon(Icons.remove))
        ],
      ),
    );
  }
}