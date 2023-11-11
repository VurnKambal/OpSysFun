import 'dart:io';
import 'process.dart';

main() {
  srtf();
}

// Animate? Processes are sorted, then the running process is moved to the front [0]
// Sort processes by arrival time then remaining time
List<Process> sortProcess(List<Process> processes, time) {
  processes.sort((a, b) {
    if (a.arrivalTime <= time && b.arrivalTime <= time) {
      // If both processes have arrived, sort processes by remaining time
      if (a.remainingTime == b.remainingTime) {
        // If remaining time is equal, sort processes by arrival time
        if (a.arrivalTime == b.arrivalTime) {
          // If arrival time is equal, sort processes by process id
          return a.processId.compareTo(b.processId);
        } else {
          // If arrival time is not equal, sort processes by arrival time
          return a.arrivalTime.compareTo(b.arrivalTime);
        }
      } else {
        // If remaining time is not equal, sort processes by remaining time
        return a.remainingTime.compareTo(b.remainingTime);
      }
    } else {
      // If either process has not arrived, sort processes by arrival time
      return a.arrivalTime.compareTo(b.arrivalTime);
    }
  });

  // Animate? Moving the running process to the front of the queue
  return processes;
}

// GitHub Copilot assisted
// Preemptive Shortest Remaining Time First
void srtf() {
  int n;
  int time = 0;
  int sumt = 0;
  int sumw = 0;
  int completed = 0;
  int sumBurstTime = 0;
  List<Process> temp = [];

  print("Enter number of processes:");
  n = int.parse(stdin.readLineSync()!);
  // n = 3;
  List<Process> processes = [
    // Process(
    //     processId: 1,
    //     arrivalTime: 0,
    //     burstTime: 3,
    //     waitingTime: 0,
    //     turnAroundTime: 0,
    //     completionTime: 0,
    //     remainingTime: 3),
    // Process(
    //     processId: 2,
    //     arrivalTime: 1,
    //     burstTime: 1,
    //     waitingTime: 0,
    //     turnAroundTime: 0,
    //     completionTime: 0,
    //     remainingTime: 1),
    // Process(
    //     processId: 3,
    //     arrivalTime: 2,
    //     burstTime: 2,
    //     waitingTime: 0,
    //     turnAroundTime: 0,
    //     completionTime: 0,
    //     remainingTime: 2)
  ];

  for (int i = 0; i < n; i++) {
    print("P ${i + 1}: ");

    print("Arrival Time: ");
    int arrivalTime = int.parse(stdin.readLineSync()!);

    print("Burst Time: ");
    int burstTime = int.parse(stdin.readLineSync()!);

    sumBurstTime += burstTime;
    processes.add(Process(
        processId: i + 1,
        arrivalTime: arrivalTime,
        burstTime: burstTime,
        remainingTime: burstTime));
  }

  print(n);

  // Initially sort processes by arrival time then burst time
  processes = sortProcess(processes, time);

  while (time <= sumBurstTime && completed < n) {
    // Time is incremented by 1
    time++;
    // Remaining time of the running process is decremented by 1
    // processes[0] is the running process
    processes[0].remainingTime -= 1;
    print("TIME: $time");

    // If process is completed
    if (processes[0].remainingTime <= 0) {
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
    }
    // print("P\tAT\tBT\tRT");
    // for (int i = 0; i < processes.length; i++) {
    //   print(
    //       "P${processes[i].processId}\t${processes[i].arrivalTime}\t${processes[i].burstTime}\t${processes[i].remainingTime}");
    // }

    // Animate? Processes are sorted, then the running process is moved to the front [9]
    // Sort processes by arrival time then remaining time
    processes = sortProcess(processes, time);
  }
  // Add completed processes to processes
  processes = temp;
  // Sort processes by process id for table
  processes.sort((a, b) => a.processId.compareTo(b.processId));

  // Display table (Debugging)
  print("P\tAT\tBT\tCT\tTAT\tWT");
  for (int i = 0; i < n; i++) {
    print(
        "P${processes[i].processId}\t${processes[i].arrivalTime}\t${processes[i].burstTime}\t${processes[i].completionTime}\t${processes[i].turnAroundTime}\t${processes[i].waitingTime}");
  }
  print("Average Turnaround Time= ${sumt / n}");
  print("Average Waiting Time= ${sumw / n}");
}
