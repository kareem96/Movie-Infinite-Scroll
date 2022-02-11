

class PathDio {
  static const String baseUrl = 'api.themoviedb.org';

  static Uri getUrl({
    required String path,
    Map<String, dynamic>? parameters
  }){
    return Uri.https(baseUrl, path, parameters);
  }
}