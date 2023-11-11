import 'package:flutter/material.dart';
import 'package:opsys/algorithms/lru.dart';
import 'package:opsys/algorithms/sjn.dart';
import 'package:opsys/algorithms/srtf.dart';

class MemoryManagerPage extends StatelessWidget {
  const MemoryManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    srtf();
    return const MaterialApp(
      title: 'Memory Manager',
      home: MemoryManagerApp(),
    );
  }
}

class MemoryManagerApp extends StatefulWidget {
  const MemoryManagerApp({Key? key}) : super(key: key);

  @override
  _MemoryManagerAppState createState() => _MemoryManagerAppState();
}

class _MemoryManagerAppState extends State<MemoryManagerApp> {
  // MemoryManager memoryManager = MemoryManager();

  // List of memory fields
  List<Widget> memoryFields = [];

  // Add a new memory field
  void addMemoryField() {
    /*
    memoryManager.initializeMemory();
    memoryManager.relocationWithCompaction({1: 10, 2: 20, 3: 30});
    print("Memory Manager");
    print(memoryManager.memory);
    */
    sjn();
    setState(() {
      memoryFields.add(
        TextField(
          onChanged: (String value) => {},
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Memory',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Memory Manager',
            ),
            // Text Field for Memory inputs
            TextField(
              onChanged: (String value) => {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Memory',
              ),
            ),
            // Button to add new inputs
            ElevatedButton(
              onPressed: () {
                addMemoryField();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
