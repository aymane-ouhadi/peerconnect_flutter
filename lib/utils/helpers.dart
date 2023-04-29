class Helpers {

  static String substring(
    String original,
    int n
  ){
    if (original.length <= n) {
      return original;
    } else {
      return "${original.substring(0, n)}...";
    }
  }

}