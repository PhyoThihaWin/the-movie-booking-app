import 'package:hive/hive.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

import '../../data/vos/time_slot_config_vo.dart';

class TimeSlotConfigDao {
  TimeSlotConfigDao._internal();

  static final TimeSlotConfigDao _singleton = TimeSlotConfigDao._internal();

  factory TimeSlotConfigDao() {
    return _singleton;
  }

  Box<TimeSlotConfigVo> getTimeSlotConfigBox() {
    return Hive.box<TimeSlotConfigVo>(BOX_NAME_TIME_SLOT_CONFIG_VO);
  }

  void saveAll(List<TimeSlotConfigVo> list) async {
    Map<int, TimeSlotConfigVo> listMap = {
      for (var element in list) element.id ?? 0: element
    };
    getTimeSlotConfigBox().putAll(listMap);
  }

  TimeSlotConfigVo? getById(int id) {
    return getTimeSlotConfigBox()
        .values
        .where((element) => element.id == id)
        .first;
  }
}
