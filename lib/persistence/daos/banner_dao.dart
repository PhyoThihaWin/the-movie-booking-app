import 'package:hive/hive.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

import '../../data/model/vos/banner_vo.dart';

class BannerDao {
  BannerDao._internal();

  static final BannerDao _singleton = BannerDao._internal();

  factory BannerDao() {
    return _singleton;
  }

  Box<BannerVo> getBannerBox() {
    return Hive.box<BannerVo>(BOX_NAME_BANNER_VO);
  }

  void saveAllBanners(List<BannerVo> list) async {
    Map<int, BannerVo> actorMap = {
      for (var element in list) element.id ?? 0: element
    };
    getBannerBox().putAll(actorMap);
  }

  List<BannerVo> getAllBanner() {
    return getBannerBox().values.toList();
  }
}
