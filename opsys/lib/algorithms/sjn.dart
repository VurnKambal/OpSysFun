import 'dart:io';
import 'process.dart';

main() {
  sjn();
}

// Sort Proccess for SJN
List<Process> sortProcesses(List<Process> processes) {
  // Sort processes by arrival time then burst time
  processes.sort((a, b) {
    if (a.arrivalTime == b.arrivalTime) {
      // If arrival time is equal, sort processes by burst time
      if (a.burstTime == b.burstTime) {
        // If burst time is equal, sort processes by process id
        return a.processId.compareTo(b.processId);
      } else {
        // If burst time is not equal, sort processes by burst time
        return a.burstTime.compareTo(b.burstTime);
      }
    } else {
      // If arrival time is not equal, sort processes by arrival time
      return a.arrivalTime.compareTo(b.arrivalTime);
    }
  });
  return processes;
}

// GitHub Copilot assisted
// Non-Preemptive Shortest Job Next
void sjn() {
  int n = 0;
  int time = 0;
  int sumt = 0;
  int sumw = 0;
  int completed = 0;
  int sumBurstTime = 0;

  List<Process> temp = [];
  print("Enter number of processes:");
  n = int.parse(stdin.readLineSync()!);
  List<Process> processes = [];
  for (int i = 0; i < n; i++) {
    print("P ${(i + 1).toString()}: ");
    int arrivalTime = int.parse(stdin.readLineSync()!);
    int burstTime = int.parse(stdin.readLineSync()!);
    sumBurstTime += burstTime;
    processes.add(Process(
      processId: i + 1,
      arrivalTime: arrivalTime,
      burstTime: burstTime,
    ));
  }
  processes = sortProcesses(processes);

  while (time <= sumBurstTime && completed < n) {
    // If no process has arrived yet, set time by arrival time of the next process
    if (time < processes[0].arrivalTime) {
      sumBurstTime += processes[0].arrivalTime - time;
      time = processes[0].arrivalTime;
    }
    // Animate? Moving the running process to the front of the queue
    // Time is incremented by burst time of the process
    time += processes[0].burstTime;
    print("TIME: $time");

    // Animate? Completion of the running process
    completed++;
    processes[0].completionTime = time;

    // Calculation of turnaround time and waiting time
    processes[0].turnAroundTime =
        processes[0].completionTime - processes[0].arrivalTime;
    processes[0].waitingTime =
        processes[0].turnAroundTime - processes[0].burstTime;

    // Sum of turnaround time and waiting time
    sumt += processes[0].turnAroundTime;
    sumw += processes[0].waitingTime;

    // Completed process is added to temp
    temp.add(processes[0]);

    // Remove completed process from queue
    processes.removeAt(0);

    // Animate? Sort processes by arrival time then burst time
    processes = sortProcesses(processes);
  }
  print(temp);
  // Add completed processes to processes
  processes = temp;

  // Sort processes by process id for table
  processes.sort((a, b) => a.processId.compareTo(b.processId));

  // Display table (Debugging)
  print("P\tAT\tBT\tCT\tTAT\tWT");
  for (int i = 0; i < processes.length; i++) {
    print(
        "P${processes[i].processId}\t${processes[i].arrivalTime}\t${processes[i].burstTime}\t${processes[i].completionTime}\t${processes[i].turnAroundTime}\t${processes[i].waitingTime}");
  }
  print("Average Turnaround Time= ${sumt / n}");
  print("Average Waiting Time= ${sumw / n}");
}
