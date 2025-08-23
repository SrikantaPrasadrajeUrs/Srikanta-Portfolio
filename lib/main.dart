import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srikanta_portfolio/core/services/local_storage.dart';
import 'package:srikanta_portfolio/features/blocs/theme_bloc/theme_bloc.dart';
import 'package:srikanta_portfolio/features/main_view.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context)=>ThemeBloc(themeType: LocalStorage.getTheme()))
    ], child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
      builder: (context, themeState){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Portfolio",
          theme: themeState.themeData,
          home: MainView(),
        );
      },
    );
  }
}
