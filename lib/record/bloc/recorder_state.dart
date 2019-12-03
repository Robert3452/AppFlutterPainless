import 'package:equatable/equatable.dart';

abstract class RecorderState extends Equatable {
  const RecorderState();
}

class InitialRecorderState extends RecorderState {
  @override
  List<Object> get props => [];
}
class StartRecorderState extends RecorderState{
  @override
  List<Object> get props => [];

}
class InitRecorderState extends RecorderState {
  @override
  List<Object> get props => [];
}

class RecorderInBlocState extends RecorderState {
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
class RecognizingState extends RecorderState{
  final bool result;
  RecognizingState(this.result);
  @override
  List<Object> get props => [result];
}
