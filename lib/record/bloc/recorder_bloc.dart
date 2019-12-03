import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_painless/record/bloc/http_logic.dart';
import './bloc.dart';

import 'package:flutter_sound/flutter_sound.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  FlutterSound flutterSound;
  final HttpLogic logic;
  RecorderBloc({@required this.logic});
  @override
  RecorderState get initialState => InitialRecorderState();

  @override
  Stream<RecorderState> mapEventToState(
    RecorderEvent event,
  ) async* {
    if (event is VoiceRecognizing) {
      print('esta reconociendo');
      bool result = await logic.postRequest(event.text);
      yield RecognizingState(result);
    } else if (event is DoRecordEvent) {
      yield StartRecorderState();
    } else if (event is DoStopRecordEvent) {
      yield StopRecorderState();
    } else {
      yield OnRecordState();
    }
  }
}
