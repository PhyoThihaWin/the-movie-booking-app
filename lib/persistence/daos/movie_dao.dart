import 'package:dart_extensions/dart_extensions.dart';
import 'package:hive/hive.dart';
import 'package:moviebooking/persistence/hive_constants.dart';
import 'package:moviebooking/utils/ext.dart';

import '../../data/model/vos/banner_vo.dart';
import '../../data/model/vos/movie_vo.dart';

class MovieDao {
  MovieDao._internal();

  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  Box<MovieVo> getMovieBox() {
    return Hive.box<MovieVo>(BOX_NAME_MOVIE_VO);
  }

  void saveAllMovies(List<MovieVo> list) async {
    Map<int, MovieVo> actorMap = {
      for (var element in list) element.id ?? 0: element
    };
    getMovieBox().putAll(actorMap);
  }

  List<MovieVo> getAllMovie() {
    return getMovieBox().values.toList();
  }

  List<MovieVo> getMoviesByStatus(String status) {
    List<MovieVo> list;
    if (status == "current") {
      list = getMovieBox()
          .values
          .where((element) => element.isCurrent.orFalse)
          .toList();
    } else {
      list = getMovieBox()
          .values
          .where((element) => element.isComingSoon.orFalse)
          .toList();
    }
    return list;
  }
}
