import 'package:flutter/material.dart';
import 'package:flutter_app_painless/widgets/floating_action_btn.dart';

///Librerias de grabacion que se importan
import 'dart:io';
import 'dart:async';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_app_painless/record/bloc/storage.dart';

class ScreenRecorder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenRecorder();
  }
}

class _ScreenRecorder extends State<ScreenRecorder> {
  //CREACION DE UN OBJETO STORAGE
  final Storage storage = Storage();
  bool exist;
  //FLUTTER SOUNDS
  bool _isRecording = false; //boton
  StreamSubscription _recorderSubscription;
  StreamSubscription _dbPeakSubscription;
  FlutterSound flutterSound;

  String _recorderTxt = '00:00:00'; //el tiempo que transcurre mientras graba
  double _dbLevel; //la cantidad de decibeles que puede percibir

  double sliderCurrentPosition = 0.0;
  double maxDuration = 1.0;

  @override
  void initState() {
    super.initState();
    flutterSound = FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();
    verifyDirectory();
  }

  void verifyDirectory() async {
    exist = await storage.checkRepository();
    print('Checked $exist');
    if (!exist) {
      print('no existe');
      storage.createDirectory();
    }
  }

  void startRecorder() async {
    try {
      String name = await storage.defaultFileName;
      String path = await flutterSound.startRecorder(Platform.isIOS
          ? 'Painless/audio/$name.m4a'
          : 'Painless/audio/$name.mp3');
      print('startRecorder: $path');

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date = DateTime.fromMillisecondsSinceEpoch(
            e.currentPosition.toInt(),
            isUtc: true);
        String txt = DateFormat('mm:ss:SS', 'es_PE').format(date);
        // txt = txt.substring(0, 8);
        setState(() {
          _recorderTxt = txt.substring(0, 8);
        });
      });
      _dbPeakSubscription =
          flutterSound.onRecorderDbPeakChanged.listen((value) {
        print('got update -> $value');
        setState(() {
          _dbLevel = value;
        });
      });
      setState(() {
        _isRecording = true;
      });
    } catch (err) {
      print('startRecord error: $err');
    }
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

      setState(() {
        _isRecording = false;
      });
    } catch (err) {
      print('stoprecorder error: $err');
    }
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _recorderTxt,
            style: TextStyle(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
          Text(
            _isRecording ? "Grabando" : "Comience a grabar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white38,
            ),
          ),
          _isRecording
              ? LinearProgressIndicator(
                  value: 100.0 / 160.0 * (_dbLevel ?? 1) / 100,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.deepOrange,
                )
              : Container(),
          Container(
            margin: EdgeInsets.only(top: screenHeight * .1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionBtn(
                  bGcolor: 0xFFFF5722,
                  color: 0xFFFFFFFF,
                  iconData: !_isRecording ? Icons.brightness_1 : Icons.pause,
                  key: null,
                  onPressed: () {
                    if (!_isRecording) {
                      return startRecorder();
                    }
                    stopRecorder();
                  },
                  mini: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
