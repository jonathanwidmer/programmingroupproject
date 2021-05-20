class Timer {
  int savedTime; // when timer started
  int totalTime; // how long timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  //starting the timer
  void start() {
    savedTime = millis(); // when the timer starts it stores the current time in milliseconds
  }

  // the function isFinished() returns true if 5,000 ms have passed 
  // the work of the timer is farmed out to this method
  boolean isFinished() {
    // check how much time has passed
    int passedTime = millis()- savedTime;
    // ternary statement
    return (passedTime>totalTime) ? true : false;
  }
}
