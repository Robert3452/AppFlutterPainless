import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/storage.dart';
import 'package:flutter_app_painless/widgets/floating_action_btn.dart';
import 'package:path/path.dart' as p;

class FileCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileCards();
  }
}

class _FileCards extends State<FileCards> {
  Storage storage = Storage();

  @override
  void initState(){
    super.initState();
    check();
  }

  void check ()async{
    bool exist = await storage.checkRepository();
    // print ('Prueba $exist');
    if(!exist){
      storage.createDirectory();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11),
        child: FutureBuilder(
          future: storage.readFiles(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start.');
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return snapshot.data != null
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 65,
                                  child: ListTile(
                                    leading: FloatingActionBtn(
                                      bGcolor: 0x3DFFFFFF,
                                      iconData: Icons.play_arrow,
                                      onPressed: () {},
                                      color: 0x4DFFFFFF,
                                      mini: true,
                                      key: null,
                                    ),
                                    title: Text(
                                      p.basename(
                                          snapshot.data[index].absolute.path),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      "Extension: ${p.extension(snapshot.data[index].absolute.path).replaceFirst('.', '')}",
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Divider(color: Colors.white24,thickness: 0,),
                                )
                              ],
                            )
                        )
                    : Center(
                        child: Text('Aun no hay grabaciones'),
                      );
            }
          },
        ));
  }
}
