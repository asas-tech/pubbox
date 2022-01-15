enum SnackbarType { top, bottom }

extension ParseToString on SnackbarType {
  String toShortString() {
    return toString().split('.').last;
  }
}
