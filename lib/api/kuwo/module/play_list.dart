part of '../kuwo.dart';

///歌单标签
Future<Answer> _playListTag(Map params, List<Cookie> cookie) {
  return _get(
    "http://kuwo.cn/api/www/playlist/getTagList",
    params: {},
    cookie: cookie,
  );
}

///热门歌单
///order:hot,new
Future<Answer> _playList(Map params, List<Cookie> cookie) {
  var data = {
    "pn": params["page"],
    "rn": params["size"],
  };

  if (params["id"] != null) {
    data["id"] = params["id"];
  } else {
    data["order"] = params["order"] ?? "new";
  }

  var url = "http://kuwo.cn/api/www/classify/playlist/${data.containsKey("id") ? "getTagPlayList" : "getRcmPlayList"}";

  return _get(
    url,
    params: data,
    cookie: cookie,
  );
}

Future<Answer> _playListInfo(Map params, List<Cookie> cookie) {
  return _get(
    "http://kuwo.cn/api/www/playlist/playListInfo",
    params: {
      "pid": params["pid"],
      "pn": params["page"]??1,
      "rn": params["size"]??30,
    },
    cookie: cookie,
  );
}