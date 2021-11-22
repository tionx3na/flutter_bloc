import 'package:app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // wrap the root of the subtree/tree with BlocProvider to make it available to
    // all the nodes below the root.
    return BlocProvider<CounterCubit>(
      create: (context) =>
          CounterCubit(), // pass the context to CounterCubit class
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if(state.wasIncremented == true){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('incremented!!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
          else if(state.wasIncremented == false){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('decremented!!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              /* To actually show the changing state on the screen, you need to wrap the
                  widget that needs to be state changed inside a blocbuilder for now! and pass
                  CounterCubit and CounterState class to it. Then access the state using the 
                  'state' keyword. */
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      // we call the decrement fucntion
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // we call the increment function
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
