import 'package:ditonton/data/models/series/series_model.dart';
import 'package:equatable/equatable.dart';

class SeriesResponse extends Equatable {
  final List<SeriesModel> SeriesList;

  SeriesResponse({required this.SeriesList});

  factory SeriesResponse.fromJson(Map<String, dynamic> json) => SeriesResponse(
        SeriesList: List<SeriesModel>.from((json["results"] as List)
            .map((x) => SeriesModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(SeriesList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [SeriesList];
}
