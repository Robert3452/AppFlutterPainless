import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/ui/screens/nav.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_app_painless/record/bloc/bloc_record.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        home: Nav(),
      ),
      bloc: RecordBloc(),
    );
  }
}
