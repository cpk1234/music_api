import 'package:flutter/material.dart';
import 'package:music_api/api/kugou/kugou.dart';

class KuGouPage extends StatefulWidget {
  const KuGouPage({Key? key}) : super(key: key);

  @override
  _KuGouPageState createState() => _KuGouPageState();
}

class _KuGouPageState extends State<KuGouPage> with AutomaticKeepAliveClientMixin {
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
                      KuGou?.banner().then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('新歌推荐'),
                    onTap: () {
                      KuGou?.musicList().then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('排行榜列表'),
                    onTap: () {
                      KuGou?.bangList().then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('排行榜详情'),
                    onTap: () {
                      KuGou?.bangInfo(rankId: "8888").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('排行榜歌曲'),
                    onTap: () {
                      KuGou?.bangSong(rankId: "8888").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('专辑列表，新碟上架'),
                    onTap: () {
                      KuGou?.albumList().then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('推荐歌单'),
                    onTap: () {
                      KuGou?.playList().then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌单详情'),
                    onTap: () {
                      KuGou?.playListInfo(id: "2467396", page: 1).then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌手列表'),
                    onTap: () {
                      KuGou?.singerList(classId: "88").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌手信息'),
                    onTap: () {
                      KuGou?.singerInfo(id: "3520").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌手单曲'),
                    onTap: () {
                      KuGou?.singerSong(id: "3520").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌手专辑'),
                    onTap: () {
                      KuGou?.singerAlbum(id: "3520").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌手Mv'),
                    onTap: () {
                      KuGou?.singerMv(id: "3520").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('专辑信息'),
                    onTap: () {
                      KuGou?.albumInfo(albumId: "38080072").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('专辑歌曲'),
                    onTap: () {
                      KuGou?.albumSong(albumId: "38080072").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('歌曲详情'),
                    onTap: () {
                      KuGou?.musicInfo(hash: "37FB544283B501DDC7D9CEE59FCC2B32", albumAudioId: "32042828").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('MV列表'),
                    onTap: () {
                      KuGou?.mvList().then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('MV详情'),
                    onTap: () {
                      KuGou?.mvInfo(hash: "BC31D031AE3C698D7B767308CD26FC08").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('搜索提示'),
                    onTap: () {
                      KuGou?.searchTip(keyword: "周杰伦").then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('搜索单曲'),
                    onTap: () {
                      KuGou?.searchSong(keyword: "周杰伦", size: 10).then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('搜索专辑'),
                    onTap: () {
                      KuGou?.searchAlbum(keyword: "周杰伦", size: 10).then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('搜索mv'),
                    onTap: () {
                      KuGou?.searchMv(keyword: "周杰伦", size: 10).then(onData).catchError(onError);
                    },
                  ),
                  ListTile(
                    title: const Text('搜索歌单'),
                    onTap: () {
                      KuGou?.searchPlayList(keyword: "周杰伦", size: 10).then(onData).catchError(onError);
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

  void onData(value) {
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
