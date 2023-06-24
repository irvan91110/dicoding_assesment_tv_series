import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/Series/Series.dart';
import 'package:ditonton/domain/usecases/series/get_top_rated_series.dart';
import 'package:flutter/foundation.dart';

class TopRatedSeriesNotifier extends ChangeNotifier {
  final GetTopRatedSeries getTopRatedSeries;

  TopRatedSeriesNotifier({required this.getTopRatedSeries});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Series> _Series = [];
  List<Series> get series => _Series;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (seriesData) {
        _Series = seriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
