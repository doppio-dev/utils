class Helper {
  Map<String, String> getParams(List<String> arguments) {
    if (arguments.isNotEmpty) {
      for (var item in arguments) {
        if (!item.contains('=')) {
          throw Exception('use params with =');
        }
      }
    }
    var map = <String, String>{};
    for (var item in arguments) {
      var keyValue = item.split('=');
      map.putIfAbsent(keyValue[0], () => keyValue[1]);
    }
    return map;
  }
}
