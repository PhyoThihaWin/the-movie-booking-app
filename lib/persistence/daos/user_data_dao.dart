import 'package:hive/hive.dart';
import 'package:moviebooking/data/vos/user_data_vo.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

class UserDataDao {
  UserDataDao._internal();

  static final UserDataDao _singleton = UserDataDao._internal();

  factory UserDataDao() {
    return _singleton;
  }

  Box<UserDataVo> getUserDataBox() {
    return Hive.box<UserDataVo>(BOX_NAME_USER_DATA_VO);
  }

  void saveUserData(UserDataVo userData) async {
    getUserDataBox().put(userData.id, userData);
  }

  UserDataVo? getUserData() {
    return getUserDataBox().values.length > 0
        ? getUserDataBox().getAt(0)
        : null;
  }
}
