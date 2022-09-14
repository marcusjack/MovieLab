// ignore_for_file: constant_identifier_names
enum SystemUIOverlayStyle { DARK, LIGHT, RED }

enum ImdbList { TOP_250_MOVIES, TOP_250_TVS, BoxOffice, AllTimeBoxOffice }

enum RequestResult {
  NOT_STARTED,
  LOADING,
  SUCCESS,
  FAILURE,
  FAILURE_USER_PROBLEM,
  FAILURE_SERVER_PROBLEM
}

enum ListName {
  WATCHLIST,
  HISTORY,
  COLLECTION,
  FAVORITE_ARTISTS,
  FAVORITE_TRAILERS,
  PERSONAL_LIST
}

enum ItemType { MOVIE, TV, ARTIST, OTHER, UNKNOWN }

enum ShowType {
  SEARCH_PAGE,
  OFFICIAL_LIST,
  USER_LIST,
  USER_HISTORY,
  EPISODE,
  BOX_OFFICE,
  RECOMMENDED
}
