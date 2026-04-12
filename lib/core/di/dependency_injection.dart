import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Secure Storage
  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);

  // Dio
  Dio dio = Dio(BaseOptions(
    receiveTimeout: const Duration(seconds: 15),
    connectTimeout: const Duration(seconds: 15),
  ));
  getIt.registerLazySingleton<Dio>(() => dio);
}
