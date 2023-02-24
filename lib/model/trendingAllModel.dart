class TrendingAll {
  bool? _adult;
  String? _backdropPath;
  int? _id;
  String? _title;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  String? _posterPath;
  String? _mediaType;
  List<int>? _genreIds;
  double? _popularity;
  String? _releaseDate;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  TrendingAll(
      {bool? adult,
        String? backdropPath,
        int? id,
        String? title,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        String? posterPath,
        String? mediaType,
        List<int>? genreIds,
        double? popularity,
        String? releaseDate,
        bool? video,
        double? voteAverage,
        int? voteCount}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (backdropPath != null) {
      this._backdropPath = backdropPath;
    }
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (originalLanguage != null) {
      this._originalLanguage = originalLanguage;
    }
    if (originalTitle != null) {
      this._originalTitle = originalTitle;
    }
    if (overview != null) {
      this._overview = overview;
    }
    if (posterPath != null) {
      this._posterPath = posterPath;
    }
    if (mediaType != null) {
      this._mediaType = mediaType;
    }
    if (genreIds != null) {
      this._genreIds = genreIds;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (releaseDate != null) {
      this._releaseDate = releaseDate;
    }
    if (video != null) {
      this._video = video;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  String? get backdropPath => _backdropPath;
  set backdropPath(String? backdropPath) => _backdropPath = backdropPath;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get originalLanguage => _originalLanguage;
  set originalLanguage(String? originalLanguage) =>
      _originalLanguage = originalLanguage;
  String? get originalTitle => _originalTitle;
  set originalTitle(String? originalTitle) => _originalTitle = originalTitle;
  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;
  String? get posterPath => _posterPath;
  set posterPath(String? posterPath) => _posterPath = posterPath;
  String? get mediaType => _mediaType;
  set mediaType(String? mediaType) => _mediaType = mediaType;
  List<int>? get genreIds => _genreIds;
  set genreIds(List<int>? genreIds) => _genreIds = genreIds;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  bool? get video => _video;
  set video(bool? video) => _video = video;
  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;

  TrendingAll.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _id = json['id'];
    _title = json['title'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _mediaType = json['media_type'];
    _genreIds = json['genre_ids'].cast<int>();
    _popularity = json['popularity'];
    _releaseDate = json['release_date'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    data['id'] = this._id;
    data['title'] = this._title;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['poster_path'] = this._posterPath;
    data['media_type'] = this._mediaType;
    data['genre_ids'] = this._genreIds;
    data['popularity'] = this._popularity;
    data['release_date'] = this._releaseDate;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    return data;
  }
}