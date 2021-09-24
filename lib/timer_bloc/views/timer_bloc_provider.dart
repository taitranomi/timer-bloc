import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/timer_bloc/blocs/timer_event_bloc.dart';
import 'package:timer_bloc/timer_bloc/ticker.dart';
import 'package:timer_bloc/timer_bloc/views/timer_bloc_view.dart';

class TimerBlocProvider extends StatelessWidget {
  const TimerBlocProvider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerEventBloc(ticker: Ticker()),
      child: TimerBlocView(), // timer_bloc_view
    );
  }
}