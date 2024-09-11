class SearchResultModel {
  num? resultCount;
  List<Results>? results;

  SearchResultModel({this.resultCount, this.results});

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? wrapperType;
  String? kind;
  num? artistId;
  num? collectionId;
  num? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  num? discCount;
  num? discNumber;
  num? trackCount;
  num? trackNumber;
  num? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  bool? isStreamable;
  String? contentAdvisoryRating;
  num? collectionArtistId;
  String? collectionArtistName;
  String? feedUrl;
  num? collectionHdPrice;
  String? artworkUrl600;
  List<String>? genreIds;
  List<String>? genres;
  String? collectionArtistViewUrl;

  Results(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.isStreamable,
      this.contentAdvisoryRating,
      this.collectionArtistId,
      this.collectionArtistName,
      this.feedUrl,
      this.collectionHdPrice,
      this.artworkUrl600,
      this.genreIds,
      this.genres,
      this.collectionArtistViewUrl});

  Results.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    artistId = json['artistId'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    artistViewUrl = json['artistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    isStreamable = json['isStreamable'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    collectionArtistId = json['collectionArtistId'];
    collectionArtistName = json['collectionArtistName'];
    feedUrl = json['feedUrl'];
    collectionHdPrice = json['collectionHdPrice'];
    artworkUrl600 = json['artworkUrl600'];
    // genreIds = json['genreIds'].cast<String>();
    // genres = json['genres'].cast<String>();
    collectionArtistViewUrl = json['collectionArtistViewUrl'];
  }
}
