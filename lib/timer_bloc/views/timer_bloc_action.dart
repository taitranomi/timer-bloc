import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/timer_bloc/blocs/timer_event_bloc.dart';

class TimerBlocAction extends StatelessWidget {
  const TimerBlocAction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerEventBloc, TimerEventState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if(state is TimerInitial) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerEventBloc>().add(TimerStarted(duration: state.duration)),
              ),
            ],

            if(state is TimerRunInprogress) ...[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () => context.read<TimerEventBloc>().add(TimerPause()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerEventBloc>().add(TimerReset()),
              ),
            ],

            if(state is TimerRunPause) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerEventBloc>().add(TimerResume()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerEventBloc>().add(TimerReset()),
              ),
            ],

            if(state is TimerRunCompleted) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerEventBloc>().add(TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}