import 'package:dwrl_project/features/auth/data/firebase_auth_repo.dart';
import 'package:dwrl_project/features/auth/presentation/componentants/my_loading.dart';
import 'package:dwrl_project/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:dwrl_project/features/auth/presentation/cubits/auth_states.dart';
import 'package:dwrl_project/features/auth/presentation/pages/auth_page.dart';
import 'package:dwrl_project/features/home/presentation/pages/home_page.dart';
import 'package:dwrl_project/features/themes/dark_mode.dart';
import 'package:dwrl_project/features/themes/light_mode.dart';
import 'package:dwrl_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // authentication repo
  final firebaseAuthRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // provide cubits to app
      providers: [
        // auth cubit
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(authRepo: firebaseAuthRepo)..checkAuth(),
        ),
      ],
      // provide themes to app
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DWLR Data Analytics App',
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: ThemeMode.system,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            // if unauthenticated show auth page
            if (state is Unauthenticated) {
              return AuthPage();
            }
            // if authenticated show home page
            if (state is Authenticated) {
              return const HomePage();
            }
            // loading state
            return const LoadingScreen();
          },
          listener: (context, state) {
            // listen for auth state changes
            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}
