import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:music_api/api/utils/answer.dart';
import 'package:music_api/api/utils/types.dart';
import 'package:music_api/api/utils/utils.dart';
import 'package:music_api/http/http.dart';

part 'module/ad.dart';

part 'module/index.dart';

part 'module/album.dart';

part 'module/song.dart';

part 'module/artist.dart';

part 'module/search.dart';

part 'module/bd.dart';

part 'module/track_list.dart';

part 'module/video.dart';

part 'module/account.dart';

part 'module/favorite.dart';

part 'module/oauth.dart';

part 'module/user.dart';

class Baidu {
  Baidu._();

  ///开屏
  static Future openScreen() {
    return _openScreen.call({}, []);
  }

  ///首页
  static Future index() {
    return _index.call({}, []);
  }

  ///专辑推荐
  static Future albumList({int? page, int? size}) {
    return _albumList.call({
      "page": page,
      "size": size,
    }, []);
  }

  ///专辑详情
  static Future albumInfo({String? albumAssetCode}) {
    return _albumInfo.call({"albumAssetCode": albumAssetCode}, []);
  }

  ///歌曲列表，新歌推荐
  static Future songList({int? page, int? size}) {
    return _songList.call({"page": page, "size": size}, []);
  }

  ///歌曲信息(播放地址。Vip歌曲只能获取30秒)
  static Future songInfo({String? tsId, int? rate}) {
    return _songInfo.call({"tsId": tsId, "rate": rate}, []);
  }

  ///歌曲列表，新歌推荐
  static Future songDownload({String? tsId, int? rate}) {
    return _songDownload.call({"tsId": tsId, "rate": rate}, []);
  }

  ///歌曲列表，新歌推荐
  /*
  //  * 歌手列表
  //  * @param page 从1开始
  //  * @param size 默认20
  //  * @param artistGender 性别(男、女、组合、乐队),值是写死的; 这个不传不分页; 这个参数必须在地区之前，不然获取不到值
  //  * @param artistRegion 地区(内地、港台、欧美、韩国、日本、其他),值是写死的,这个不传不分页
  // */
  static Future artistList({int? page, int? size, String? artistGender, String? artistRegion}) {
    return _artistList.call({"page": page, "size": size, "artistGender": artistGender, "artistRegion": artistRegion}, []);
  }

  ///歌手详情
  static Future artistInfo({String? artistCode}) {
    return _artistInfo.call({"artistCode": artistCode}, []);
  }

  ///歌手热门歌曲
  static Future artistSong({String? artistCode, int? page, int? size}) {
    return _artistSong.call({"artistCode": artistCode, "page": page, "size": size}, []);
  }

  ///歌手热门专辑
  static Future artistAlbum({String? artistCode, int? page, int? size}) {
    return _artistAlbum.call({"artistCode": artistCode, "page": page, "size": size}, []);
  }

  ///歌手热门视频
  static Future artistVideo({String? artistCode, int? page, int? size}) {
    return _artistVideo.call({"artistCode": artistCode, "page": page, "size": size}, []);
  }

  ///搜索
  static Future search({String? word, int? page, int? size, int? type}) {
    return _search.call({"word": word, "page": page, "size": size, "type": type}, []);
  }

  ///搜索热词
  static Future searchSug({String? word}) {
    return _searchSug.call({"word": word}, []);
  }

  ///榜单分类
  static Future bdType() {
    return _bdCategory.call({}, []);
  }

  ///榜单列表
  static Future bdList({String? bdid, int? page, int? size}) {
    return _bdList.call({"bdid": bdid, "page": page, "size": size}, []);
  }

  /// 歌单分类
  static Future trackListType() {
    return _trackListCategory.call({}, []);
  }

  ///榜单列表
  static Future trackListList({String? subCateId, int? page, int? size}) {
    return _trackListList.call({"subCateId": subCateId, "page": page, "size": size}, []);
  }

  ///榜单列表
  static Future trackListInfo({String? id, int? page, int? size}) {
    return _trackListInfo.call({"id": id, "page": page, "size": size}, []);
  }

  ///精选视频
  static Future videoList({int? page, int? size}) {
    return _videoList.call({"page": page, "size": size}, []);
  }

  ///视频详情
  static Future videoInfo({String? assetCode, String? rate}) {
    return _videoInfo.call({"assetCode": assetCode, "rate": rate}, []);
  }

  ///热门视频、视频推荐
  static Future videoRecommend() {
    return _videoRecommend.call({}, []);
  }

  ///视频下载
  static Future videoDownload({String? assetCode, String? rate}) {
    return _videoDownload.call({"assetCode": assetCode, "rate": rate}, []);
  }

  ///登出
  static Future logout() {
    return _logout.call({}, []);
  }

  ///账户信息
  static Future accountInfo({List<Cookie> cookie = const []}) {
    return _accountInfo.call({}, cookie);
  }

  ///修改账户信息
  static Future changeAccountInfo({String? age, String? avatar, String? birth, String? nickname, String? sex, String? intro}) {
    return _changeAccountInfo.call({"age": age, "avatar": avatar, "birth": birth, "nickname": nickname, "sex": sex, "intro": intro}, []);
  }

  ///账户歌曲列表(喜欢的歌曲？)
  static Future accountSongList({int? page, int? size}) {
    return _accountSongList.call({"page": page, "size": size}, []);
  }

  ///账户收藏等信息
  static Future accountAmount() {
    return _accountAmount.call({}, []);
  }

  ///已购专辑
  static Future accountPurchaseAlbum({int? page, int? size}) {
    return _accountPurchaseAlbum.call({"page": page, "size": size}, []);
  }

  ///已购单曲
  static Future accountPurchase({int? page, int? size}) {
    return _accountPurchase.call({"page": page, "size": size}, []);
  }

  ///收藏
  static Future favorite({String? code, String? resType}) {
    return _favorite.call({"code": code, "restype": resType}, []);
  }

  ///取消收藏
  static Future favoriteDelete({String? code, String? resType}) {
    return _favoriteDelete.call({"code": code, "restype": resType}, []);
  }

  ///收藏的列表
  static Future favoriteList({int? page, int? size}) {
    return _favoriteList.call({"page": page, "size": size}, []);
  }

  ///发送短信验证码
  static Future sendSms({String? phone}) {
    return _sendSms.call({"phone": phone}, []);
  }

  ///登录
  static Future login({String? phone, String? code}) {
    return _login.call({"phone": phone, "code": code}, []);
  }

  ///签到
  static Future userSignIn({List<Cookie> cookie = const []}) {
    return _userSignIn.call({}, cookie);
  }

  ///服务使用
  static Future api(String path, {Map? params, String? auth}) {
    if (!_api.containsKey(path)) {
      return Future.value(const Answer().copy(body: {'code': 500, 'msg': "此 api url 未被定义, 请检查: $path ", 'path': _api.keys.toList()}));
    }
    return _api[path]!.call(params ?? {}, []);
  }
}

//Api列表
final _api = <String, Api>{
  "/openScreen": _openScreen,
  "/index": _index,
  "/album/info": _albumInfo,
  "/album/list": _albumList,
};

Options _buildOptions(List<Cookie> cookies) {
  final options = Options();
  options.sendTimeout = 3000;
  options.receiveTimeout = 3000;
  final headers = {
    "app-version": "v8.3.0.3",
    "from": "android",
    "user-agent": "Mozilla/5.0 (Linux; U; Android 8.0.0; zh-cn; MI 5 Build/OPR1.170623.032) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30",
  };

  var authorization = cookies.firstWhere((element) => element.name == "auth", orElse: () => Cookie("auth", "")).value;
  if (authorization.isNotEmpty) {
    headers["authorization"] = "/access_token $authorization";
  }

  options.headers = headers;
  return options;
}

///请求,baidu的参数有严格的顺序，错了就请求不到，所以，如果接口里存在appid，不要动，不是随便写的
Future<Answer> _get(String path, {Map<String, dynamic> params = const {}, List<Cookie> cookie = const []}) async {
  final options = _buildOptions(cookie);

  LinkedHashMap signStr = LinkedHashMap();
  if (!params.containsKey("appid")) {
    signStr['appid'] = '16073360';
  } else {
    params['appid'] = '16073360';
  }

  params.forEach((key, value) {
    signStr[key] = value;
  });

  var timestamp = DateTime.now().millisecondsSinceEpoch;
  signStr["timestamp"] = "$timestamp";

  var sign = paramsSign(toParamsString(signStr));

  signStr["sign"] = sign;

  return Http.get(path, params: Map.from(signStr), options: options).then((value) {
    try {
      if (value?.statusCode == 200) {
        var cookies = value?.headers[HttpHeaders.setCookieHeader] ?? [];
        var ans = const Answer();
        ans = ans.copy(cookie: cookies.map((str) => Cookie.fromSetCookieValue(str)).toList());
        var data = value?.data;
        ans = ans.copy(status: value?.statusCode, body: data);
        return Future.value(ans);
      } else {
        return Future.value(Answer(status: 500, body: {'code': value?.statusCode, 'msg': value?.data}));
      }
    } catch (e) {
      return Future.value(const Answer(status: 500, body: {'code': 500, 'msg': "对象转换异常"}));
    }
  });
}

//请求
Future<Answer> _post(String path, {Map<String, dynamic> params = const {}, List<Cookie> cookie = const []}) async {
  final options = _buildOptions(cookie);

  LinkedHashMap signStr = LinkedHashMap();
  if (!params.containsKey("appid")) {
    signStr['appid'] = '16073360';
  } else {
    params['appid'] = '16073360';
  }

  params.forEach((key, value) {
    signStr[key] = value;
  });

  var timestamp = DateTime.now().millisecondsSinceEpoch;
  signStr["timestamp"] = "$timestamp";

  var sign = paramsSign(toParamsString(signStr));

  signStr["sign"] = sign;

  return Http.postForm(path, params: Map.from(signStr), options: options).then((value) {
    try {
      if (value?.statusCode == 200) {
        var cookies = value?.headers[HttpHeaders.setCookieHeader] ?? [];
        var ans = const Answer();
        ans = ans.copy(cookie: cookies.map((str) => Cookie.fromSetCookieValue(str)).toList());
        var data = value?.data;
        ans = ans.copy(status: value?.statusCode, body: data);
        return Future.value(ans);
      } else {
        return Future.value(Answer(status: 500, body: {'code': value?.statusCode, 'msg': value?.data}));
      }
    } catch (e) {
      return Future.value(const Answer(status: 500, body: {'code': 500, 'msg': "对象转换异常"}));
    }
  });
}

String paramsSign(String params) {
  const secret = "0b50b02fd0d73a9c4c8c3a781c30845f";
  return md5.convert(utf8.encode("$params$secret")).toString();
}