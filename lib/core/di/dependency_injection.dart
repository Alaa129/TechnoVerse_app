import 'package:alaa/features/auth_screens/logic/cubit/google_auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  // Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // initialize google sign in and firebase auth
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  // google sign in
  getIt.registerLazySingleton<GoogleAuthCubit>(
      () => GoogleAuthCubit(getIt(), getIt()));
}
