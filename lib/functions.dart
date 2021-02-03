class IFunctions {
  String ucWords(String text) {
    if (text != "") {
      text = text.toLowerCase();
      return text[0].toUpperCase() + text.substring(1);
    }
    return text;
  }

//  Future<File> compressAndGetFile(
//      File file, int quality, String fileName) async {
//    final result = await FlutterImageCompress.compressAndGetFile(
//      file.absolute.path,
//      fileName,
//      quality: quality,
//    );
//    return result;
//  }
}

IFunctions functions = new IFunctions();
