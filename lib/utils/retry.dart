Future<T> retry<T>(
  Future<T> Function() function, {
  int maxRetries = 1,
  Duration retryDelay = const Duration(seconds: 3),
}) async {
  for (int retry = 0; retry < maxRetries; retry++) {
    try {
      return await function();
    } catch (e) {
      if (retry < maxRetries - 1) {
        await Future.delayed(retryDelay);
      }
    }
  }
  throw Exception("Function failed after $maxRetries retries.");
}
