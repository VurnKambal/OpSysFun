import 'package:flutter/services.dart';

class MemoryManager {
  List<Map<String, dynamic>> memory = [];
  int totalMemorySize = 100; // total memory size
  Map<int, int> unallocatedProcesses = {};

  void initializeMemory() {
    memory.clear();

    // Initialize memory list with a size of 100
    var memoryBlock = {
      "BeginningAddress": 0,
      "BlockSize": 100,
      "Status": false
    };
    memory.add(memoryBlock);
  }

  // Relocation with Compaction (processes = [{ProcessId, ProcessSize}])
  void relocationWithCompaction(Map<int, int> processes) {
    processes.forEach((proceessID, processSize) {
      // Find the first memory block with enough space
      var memoryBlockIndex = memory.indexWhere(
        (memoryBlock) =>
            memoryBlock["Status"] == false &&
            memoryBlock["BlockSize"] >= processes[proceessID],
      );
      print(memoryBlockIndex);
      if (memoryBlockIndex < 0) {
        unallocatedProcesses[proceessID] = processes[proceessID]!;
      } else {
        memory.add({
          "BeginningAddress": memory[memoryBlockIndex]["BeginningAddress"] +
              processes[proceessID],
          "BlockSize":
              memory[memoryBlockIndex]["BlockSize"] - processes[proceessID],
          "Status": false
        });
        memory[memoryBlockIndex]["BlockSize"] = processes[proceessID];
        memory[memoryBlockIndex]["Status"] = true;
      }
    });
  }

  // Page Replacement Policy Least Recently Used
  void leastRecentlyUsed() {}
}

const MethodChannel channel = MethodChannel('opsys.memory_manager');
LRU(List processes) {
  LRUa(processes);
  print("AHHHHH");
}

Future<void> LRUa(List processes) async {
  // LRU
  var result = await channel.invokeMethod('LRU', processes);

  // Print result
  print(result);
}
