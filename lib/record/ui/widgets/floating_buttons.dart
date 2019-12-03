import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/bloc/bloc.dart';
import 'package:flutter_app_painless/record/ui/screens/file_manager.dart';
import 'package:flutter_app_painless/record/ui/screens/recorder.dart';
import 'package:flutter_app_painless/widgets/floating_action_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_recognition/speech_recognition.dart';

class FloatingButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingButtons();
  }
}

class _FloatingButtons extends State<FloatingButtons> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText;

  bool _isRecording = false;
  RecorderBloc _blocRec;
  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
    _blocRec = BlocProvider.of<RecorderBloc>(context);
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );
    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );
    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );
    _speechRecognition.setRecognitionCompleteHandler(() => setState(() {
              _doRecognition();
              return _isListening = false;
            })
        // setState(
        //() {
        //  postReq(resultText);
        //_doRecognition();
        //return _isListening = false;
        // return _isListening = false;
        //},
        //),
        );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FloatingActionBtn(
          color: 0xFFffffff,
          bGcolor: 0xFF232523,
          onPressed: () {
            if (_isListening) {
              _speechRecognition.cancel().then((result) => setState(() {
                    _isListening = result;
                    resultText = "";
                  }));
            } else if (_isAvailable && !_isListening) {
              _speechRecognition.listen(locale: "es_PE");
            }
          },
          key: null,
          iconData: _isListening ? Icons.stop : Icons.mic,
          mini: false,
        ),
        BlocBuilder<RecorderBloc, RecorderState>(builder: (context, state) {
          if (state is StartRecorderState) {
            _isRecording = true;
          } else if (state is StopRecorderState) {
            _isRecording = false;
          } else if (state is RecognizingState) {
            if (state.result) {
              _isRecording = true;
            }
          }
          return FloatingActionBtn(
            color: 0xFFffffff,
            bGcolor: 0xFFEE3A38,
            onPressed: _isRecording ? _doStop : _doRecord,
            key: null,
            iconData: _isRecording ? Icons.pause : Icons.brightness_1,
            mini: false,
          );
        }),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FileManager()),
            );
          },
          backgroundColor: Color(0xFF232523),
          tooltip: 'Record',
          child: Icon(
            Icons.dehaze,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  void _doRecord() {
    _blocRec.add(DoRecordEvent());
  }

  void _doStop() {
    _blocRec.add(DoStopRecordEvent());
  }

  void _doRecognition() {
    _blocRec.add(VoiceRecognizing(resultText));
  }
}
