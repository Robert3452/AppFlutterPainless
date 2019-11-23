import 'dart:async';
import 'dart:io';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Storage  {
  Future<String> get localPath async {
    final dir = await getExternalStorageDirectory();
    return dir.path;
  }

  void createDirectory() async {
    final path = await localPath;
    print('la direccion $path');
    Directory('$path/Painless/audio')
        .create(recursive: true)
        .then((Directory directory) {
      print(directory.path);
    });
  }

  Future<bool> checkRepository() async {
    final path = await localPath;
    print('la direccion $path');
    bool exist = await Directory('$path/Painless/audio').exists();
    return exist;
  }

  Future<String> get defaultFileName async {
    var today = DateTime.now();
    String defaultName = DateFormat('dd-MM-yyyy H:mm:ss').format(today);
    print('$defaultName');
    return defaultName;
  }

  Future<String> get localFile async {
    
    String fileName = await defaultFileName;
    final path = await localPath;
    print('este es el nombre completo $path/$fileName');
    return '$path/Painless/audio/$fileName';
  }
   readFiles() async{
    final String dir = await localPath;
     print ('$dir/Painless/audio');
    var fm = FileManager(root: Directory('$dir/Painless/audio'));
    var files = await fm.filesTree(extensions: ['mp3'],sortedBy: FileManagerSorting.Date);
    // print (files);
    return files;

  }
}
