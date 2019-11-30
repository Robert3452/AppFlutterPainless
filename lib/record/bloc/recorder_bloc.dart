import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

import 'package:flutter_sound/flutter_sound.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  FlutterSound flutterSound;
  @override
  RecorderState get initialState => InitialRecorderState();

  @override
  Stream<RecorderState> mapEventToState(
    RecorderEvent event,
  ) async* {
    
    if (event is DoRecordEvent) { 
      yield StartRecorderState();
    } else if (event is DoStopRecordEvent) {
      yield StopRecorderState();
    }else{
      yield OnRecordState();
    }
  }
}
