class ServerUrls {
  ServerUrls._();

  static const String _devServer = "https://fluxstore.bengalquiz.xyz/api/";
  static const String _productionServer =
      "https://fluxstore.bengalquiz.xyz/api/";

  static const String baseImageUrl = "https://fluxstore.bengalquiz.xyz/";

  static String _getFullUrl() {
    if (true) {
      return _productionServer;
    }

    return _devServer;
  }

  static String categoryUrl = "${_getFullUrl()}category";
  static String featuresProducts = "${_getFullUrl()}products/feature";
  static String tagUrls(String tag) {
    return "${_getFullUrl()}products/tags/$tag";
  }
}
