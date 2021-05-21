/**
  The Timer class is used to track how much time has passed. 
*/

class Timer {
  // declare global variables
  int savedTime; // when timer started
  int totalTime; // how long timer should last
  
  /**
    Constructor
    Constructs a Timer and sets TotalTime
  */
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  
  /**
    Starts the Timer
  */
  void start() {
    // when the timer starts it stores the current time in milliseconds
    savedTime = millis(); 
  }

  /**
    Returns true if 5,000 ms have passed.
    The work of the Timer is farmed out to this method.
  */
  boolean isFinished() {
    // check how much time has passed
    int passedTime = millis()- savedTime;
    
    // ternary statement
    // return if passed time is more than total time
    return (passedTime>totalTime) ? true : false;
  }
}
