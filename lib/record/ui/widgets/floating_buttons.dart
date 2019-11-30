import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/bloc/bloc.dart';
import 'package:flutter_app_painless/record/ui/screens/file_manager.dart';
import 'package:flutter_app_painless/widgets/floating_action_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingButtons();
  }
}

class _FloatingButtons extends State<FloatingButtons> {
  bool _isRecording = false;
  RecorderBloc _blocRec;
  @override
  void initState() {
    super.initState();
    _blocRec = BlocProvider.of<RecorderBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FloatingActionBtn(
          color: 0xFFffffff,
          bGcolor: 0xFF232523,
          onPressed: () {},
          key: null,
          iconData: Icons.mic,
          mini: false,
        ),
        BlocBuilder<RecorderBloc, RecorderState>(builder: (context, state) {
          if (state is StartRecorderState) {
            _isRecording = true;
          } else if(state is StopRecorderState){
            _isRecording = false;
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
}
