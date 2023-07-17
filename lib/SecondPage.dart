import 'package:flutter/material.dart';

import 'DataFile.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.data});
  final List<DataFile> data;
  @override
  State<SecondPage> createState() => _SecondPage();
}
class _SecondPage extends State<SecondPage> {

  bool isScroll = false;

  void updateState() {
    setState(() {
      if(isScroll) isScroll = false;
      else isScroll = true;

    }); }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            children:[
              if(!isScroll) getAppBar(),
              Expanded(child: sampleList()),
            ]
        ));
    // else {
    //   return Scaffold(
    //       body: sampleList()
    //   );
    // }
  }
  AppBar getAppBar() {
    return AppBar(title: Text("My List"),);

  }
  NotificationListener sampleList() {
    return  NotificationListener(
      child: ListView.builder(
          itemCount: widget.data.length, itemBuilder: (context, index) {
        return customList(context, widget.data[index], index);
      }), onNotification: (notif) {
      if (notif is ScrollStartNotification) {
        updateState();
        return true;
      } else if(notif is ScrollEndNotification) {
        updateState();
        return false;
      }
      else {
        return false;
      }
    },);
  }


  Widget customList(BuildContext context, DataFile info, int index) {
    if(index != 14) {
      return ListViewItem(info);
    }
    else {
      return Column(
        children: [
          ListViewItem(info),
          SizedBox(height: 70,)
        ],
      );
    }
  }

  Widget ListViewItem(DataFile info) {
    return Card(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(25, 25, 25, 25)),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(info: info)));
                  },
                  child: Container(child: Text("label  : ${info.desc}",))
              )
            ],
          ),
        ));
  }

}

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.info});

  final DataFile info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Description")),
      body: Center(
        child: Text(info.desc),
      ),
    );
  }
}