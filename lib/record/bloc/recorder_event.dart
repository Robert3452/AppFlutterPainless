import 'package:equatable/equatable.dart';

abstract class RecorderEvent extends Equatable {
  const RecorderEvent();
}

class DoRecordEvent extends RecorderEvent {
  @override
  List<Object> get props => [];
}

class OnRecordEvent extends RecorderEvent {
  @override
  List<Object> get props => [];
}

class DoStopRecordEvent extends RecorderEvent {
  @override
  List<Object> get props => [];
}
//Evento de inicio de reconocimiento de voz
class VoiceRecognizing extends RecorderEvent{
  final String text;
  VoiceRecognizing(this.text);
  @override
  List<Object> get props => [text];
}
