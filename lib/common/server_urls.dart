class ServerUrls {
  ServerUrls._();

  static const String _devServer = "https://fluxstore.bengalquiz.xyz/api/";
  static const String _productionServer = "https://fluxstore.bengalquiz.xyz/api/";

  static const String baseImageUrl = "https://fluxstore.bengalquiz.xyz/";

  static String _getFullUrl() {
    if(true) {
      return _productionServer;
    }

    return _devServer;
  }

  static String categoryUrl = "${_getFullUrl()}category";
  static String featuresProducts = "${_getFullUrl()}products/feature";
  static String shareesProducts = "${_getFullUrl()}products/tag/saree";
  static String topsProducts = "${_getFullUrl()}products/tag/tops";
  static String coordsProducts = "${_getFullUrl()}products/tag/co-ords";
  static String skirtsProducts = "${_getFullUrl()}products/tag/skirts";
  static String jeansProducts = "${_getFullUrl()}products/tag/jeans";
  static String makeupProducts = "${_getFullUrl()}products/tag/makeup";
  static String skincareProducts = "${_getFullUrl()}products/tag/skin-care";
  static String perfumeProducts = "${_getFullUrl()}products/tag/perfume";
  static String jewelleryProducts = "${_getFullUrl()}products/tag/jewellery";
  static String footProducts = "${_getFullUrl()}products/tag/foot";
  static String flatProducts = "${_getFullUrl()}products/tag/flat";
  static String heelsProducts = "${_getFullUrl()}products/tag/heels";
  static String sportsProducts = "${_getFullUrl()}products/tag/sports";
  static String shoesProducts = "${_getFullUrl()}products/tag/sports";
  static String casualProducts = "${_getFullUrl()}products/tag/casual";

}