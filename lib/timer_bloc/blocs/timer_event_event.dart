part of 'timer_event_bloc.dart';

abstract class TimerEventEvent extends Equatable {
  const TimerEventEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEventEvent {
  final int duration;
  const TimerStarted({required this.duration});
}

class TimerPause extends TimerEventEvent {
  const TimerPause();
}

class TimerResume extends TimerEventEvent {
  const TimerResume();
}

class TimerReset extends TimerEventEvent {
  const TimerReset();
}

class TimerTicked extends TimerEventEvent {
  final int duration;
  const TimerTicked({required this.duration});

  @override
  List<Object> get props => [duration];
}