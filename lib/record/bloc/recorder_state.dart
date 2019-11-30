import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sound/flutter_sound.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_sound/flutter_sound.dart';

abstract class RecorderState extends Equatable {
  const RecorderState();
}

class InitialRecorderState extends RecorderState {
  @override
  List<Object> get props => [];
}
class StartRecorderState extends RecorderState{
  // final FlutterSound flutterSound;
  // StartRecorderState( this.flutterSound );
  // final List<dynamic> list;
  // StartRecorderState(this.list);
  @override
  List<Object> get props => [];

}
class InitRecorderState extends RecorderState {
  @override
  List<Object> get props => [];
}

class RecorderInBlocState extends RecorderState {
  // final List<dynamic> entireSubscription;
  // RecorderInBlocState(this.entireSubscription);

  @override
  List<Object> get props => [];
}

class StopRecorderState extends RecorderState {
  @override
  List<Object> get props => [];
}

class OnRecordState extends RecorderState{
  @override
  List<Object> get props => [];

}
