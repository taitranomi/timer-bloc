part of 'timer_event_bloc.dart';

abstract class TimerEventState {
  final int duration;

  TimerEventState(this.duration);
  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerEventState {
  TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'Timer Initial: $duration';
}

class TimerRunInprogress extends TimerEventState {
  TimerRunInprogress(int duration) : super(duration);

  @override
  String toString() => 'Timer Run In-Progress: $duration';
}

class TimerRunPause extends TimerEventState {
  TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'Timer Run Pause: $duration';
}

class TimerRunCompleted extends TimerEventState {
  TimerRunCompleted() : super(0);
}


