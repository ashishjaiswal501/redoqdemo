import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:redoqdemo/core/hive/hive_config.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_bloc.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_event.dart';
import 'package:redoqdemo/features/home/presentation/screen/user_detail_screen.dart';
import 'package:redoqdemo/injection_container.dart';

Future<void> main() async {
  await setupDependecies();
  await HiveConfig.initHive();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<UserDetailBloc>()..add(FetchUserDetails())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 1, 79, 212)),
          useMaterial3: true,
        ),
        home: const UserDetailScreen(),
      ),
    );
  }
}
