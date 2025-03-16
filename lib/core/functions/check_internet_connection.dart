import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkInternetConnection() async {
  final bool isConnected =
      await InternetConnectionChecker.instance.hasConnection;
  return (!isConnected);
}
