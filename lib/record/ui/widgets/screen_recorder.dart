import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/bloc/bloc.dart';
import 'package:flutter_app_painless/widgets/floating_action_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_app_painless/record/storage.dart';
import 'package:intl/intl.dart' show DateFormat;

class ScreenRecorder extends StatefulWidget {
  // RecorderBloc _blocRec;
  @override
  State<StatefulWidget> createState() {
    return _ScreenRecorder();
  }
}

class _ScreenRecorder extends State<ScreenRecorder> {
  bool _isRecording = false;
  RecorderBloc _blocRec;
  StreamSubscription _recorderSubscription;
  StreamSubscription _dbPeakSubscription;
  String _recorderTxt = "00:00:00";
  double _dbLevel;
  FlutterSound flutterSound;
  Storage storage;

  @override
  void initState() {
    super.initState();
    // initSpeechRecognizer();
    storage = Storage();
    
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();
  }
  void check ()async{
    bool exist = await storage.checkRepository();
    // print ('Prueba $exist');
    if(!exist){
      storage.createDirectory();
    }
  }

  void startRecorder() async {
    check();
    String name = await storage.defaultFileName;
    String path = await flutterSound.startRecorder(Platform.isIOS
        ? 'Painless/audio/$name.m4a'
        : 'Painless/audio/$name.mp3');
    print('startRecorder: $path');
    this._recorderSubscription =
        flutterSound.onRecorderStateChanged.listen((e) {
      DateTime date = new DateTime.fromMillisecondsSinceEpoch(
          e.currentPosition.toInt(),
          isUtc: true);
      String txt = DateFormat('mm:ss:SS', 'es_US').format(date);
      setState(() {
        _recorderTxt = txt;
      });
    });
    this._dbPeakSubscription =
        flutterSound.onRecorderDbPeakChanged.listen((value) {
      setState(() {
        _dbLevel = value;
      });
    });
  }

  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');
      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }
      if (_dbPeakSubscription != null) {
        _dbPeakSubscription.cancel();
        _dbPeakSubscription = null;
      }
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<RecorderBloc, RecorderState>(builder: (context, state) {
      if (state is StartRecorderState) {
        _isRecording = true;
        startRecorder();
      }
      if (state is StopRecorderState) {
        stopRecorder();
        _isRecording = false;
      }
      _onRecord();
      return Container(
        margin: EdgeInsets.only(top: screenHeight * 0.11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _isRecording ? _recorderTxt : "00:00:00",
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            Text(
              _isRecording ? "Grabando" : "Comience a grabar",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
              ),
            ),
            _isRecording
                ? LinearProgressIndicator(
                    value: 100.0 / 160.0 * (_dbLevel ?? 1) / 100,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    backgroundColor: Colors.deepOrange,
                  )
                : Container(),
          ],
        ),
      );
    });
  }

  void _onRecord() {
    BlocProvider.of<RecorderBloc>(context).add(OnRecordEvent());
  }

  // void _alreadyRecord() {
  //   _blocRec.add(event)
  // }
}
