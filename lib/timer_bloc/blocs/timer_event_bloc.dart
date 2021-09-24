import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../ticker.dart';

part 'timer_event_event.dart';
part 'timer_event_state.dart';

class TimerEventBloc extends Bloc<TimerEventEvent, TimerEventState> {
  static const int _duration = 60;

  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerEventBloc({required Ticker ticker}) : _ticker = ticker,super(TimerInitial(_duration));

  @override
  Stream<TimerEventState> mapEventToState(
    TimerEventEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    }
    else if(event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    }
    else if(event is TimerPause) {
      yield* _mapTimerPauseToState(event);
    }
    else if(event is TimerResume) {
      yield* _mapTimerResumeToState(event);
    }
    else if(event is TimerReset) {
      yield* _mapTimerResetToState(event);
    }
  }

  Stream<TimerEventState> _mapTimerStartedToState(TimerStarted start) async* {
    yield TimerRunInprogress(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: start.duration).listen((duration) => add(TimerTicked(duration: duration)));
  }

  Stream<TimerEventState> _mapTimerTickedToState(TimerTicked ticked) async* {
    yield ticked.duration > 0 ? TimerRunInprogress(ticked.duration) : TimerRunCompleted();
  }

  Stream<TimerEventState> _mapTimerPauseToState(TimerPause pause) async* {
    if(state is TimerRunInprogress) {
      _tickerSubscription?.pause();
      yield TimerRunPause(state.duration);
    }
  }

  Stream<TimerEventState> _mapTimerResumeToState(TimerResume resume) async* {
    if(state is TimerRunPause) {
      _tickerSubscription?.resume();
      yield TimerRunInprogress(state.duration);
    }
  }

  Stream<TimerEventState> _mapTimerResetToState(TimerReset reset) async* {
    _tickerSubscription?.cancel();
    yield TimerInitial(_duration);
  }
}
