import 'package:flutter/material.dart';

import 'package:provider/src/provider.dart';
import 'package:timer_bloc/timer_bloc/blocs/timer_event_bloc.dart';

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerEventBloc bloc) => bloc.state.duration);

    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');

    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}