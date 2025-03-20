import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  List<String> daftarCounter = [];
  int counter = 1;

  void tambahCounter(){
    setState(() {
       daftarCounter.add(counter.toString());
       counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Page')), 
      body: (daftarCounter.isEmpty) ? Center(child: Text('Data kosong')) : 
      ListView.builder(
        itemCount: daftarCounter.length, 
        itemBuilder: (context, index) {
          return ListTile(title: Text(daftarCounter[index]),);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: (){
              tambahCounter();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                if (counter > 1 && daftarCounter.isNotEmpty)
                daftarCounter.removeLast();
                counter -= 1;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      
    );
  }
}