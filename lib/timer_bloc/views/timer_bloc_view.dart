import 'package:flutter/material.dart';

import 'package:timer_bloc/timer_bloc/views/background.dart';
import 'package:timer_bloc/timer_bloc/views/timer_bloc_action.dart';
import 'package:timer_bloc/timer_bloc/views/timer_display.dart';

class TimerBlocView extends StatelessWidget {
  const TimerBlocView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: Stack(
        children: <Widget>[
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TimerDisplay(),
              TimerBlocAction(),
            ],
          ),
        ],
      )
    );
  }
}