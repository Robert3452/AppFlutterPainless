import 'dart:async';

import 'package:equatable/equatable.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_app_painless/record/ui/screens/recorder.dart';

abstract class RecorderEvent extends Equatable {
  const RecorderEvent();
}

class InitParamEvent extends RecorderEvent{
  @override
  List<Object> get props =>[];
}

class DoRecordEvent extends RecorderEvent{
  @override
  List<Object> get props => [];

}
class OnRecordEvent extends RecorderEvent{
  @override
  List<Object> get props => [];

}
class DoStopRecordEvent extends RecorderEvent{
  // final StreamSubscription recorderSubscription;
  // final StreamSubscription dbPeakSubscription;
  // DoStopRecordEvent(this.dbPeakSubscription, this.recorderSubscription);
  @override
  List<Object> get props => [];
  
}