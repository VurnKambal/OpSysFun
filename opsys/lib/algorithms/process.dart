// GitHub Copilot assisted
class Process {
  int processId;
  int arrivalTime;
  int burstTime;
  int waitingTime;
  int turnAroundTime;
  int completionTime;
  int remainingTime;

  Process(
      {required this.processId,
      required this.arrivalTime,
      required this.burstTime,
      this.waitingTime = 0,
      this.turnAroundTime = 0,
      this.completionTime = 0,
      this.remainingTime = 0});
}
