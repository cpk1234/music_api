import 'package:flutter/material.dart';
import 'package:music_api/api/netease/netease.dart';
import 'package:music_api/utils/answer.dart';

class NeteasePage extends StatefulWidget {
  const NeteasePage({Key? key}) : super(key: key);

  @override
  _NeteasePageState createState() => _NeteasePageState();
}

class _NeteasePageState extends State<NeteasePage> with AutomaticKeepAliveClientMixin {
  String result = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Text(result, style: const TextStyle(fontSize: 16)),
              ),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 40),
                children: [
                  ListTile(
                    title: const Text('Banner'),
                    onTap: () {
                      Netease.banner().then(onData).catchError(onError);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void onData(Answer value) {
    setState(() {
      result = value.body.toString();
    });
  }

  void onError(e) {
    setState(() {
      result = e.toString();
    });
  }
}