import 'package:hive/hive.dart';
import 'package:moviebooking/data/vos/user_data_vo.dart';
import 'package:moviebooking/persistence/hive_constants.dart';

import '../../data/vos/movie_detail_vo.dart';

class MovieDetailDao {
  MovieDetailDao._internal();

  static final MovieDetailDao _singleton = MovieDetailDao._internal();

  factory MovieDetailDao() {
    return _singleton;
  }

  Box<MovieDetailVo> getMovieDetailBox() {
    return Hive.box<MovieDetailVo>(BOX_NAME_MOVIE_DETAIL_VO);
  }

  void saveMovieDetail(MovieDetailVo data) async {
    getMovieDetailBox().put(data.id, data);
  }

  MovieDetailVo? getMovieDetail(int movieId) {
   return getMovieDetailBox().get(movieId);
  }

}
