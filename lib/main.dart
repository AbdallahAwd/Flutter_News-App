import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/shared/Cubit/Cubit.dart';
import 'package:learning/shared/Cubit/states.dart';
import 'package:learning/shared/networking/lacal/cacheHelper.dart';
import 'package:learning/shared/networking/remote/DioHelper.dart';
import 'layout/Home.dart';
import 'shared/block_observer.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   await CacheHelper.init();
   bool isDark = CacheHelper.getData(key: 'isDark');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool isDark;

  MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getData()..getScienceData()..getSportsData()..getsearchData()..darkMode(shredDark: isDark),
          ),
      ],
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state) {},
        builder: (context , state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.orange,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(color: Colors.black , size: 20.0),
                actionsIconTheme: IconThemeData(color: Colors.black, size: 20.0),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.orange,
                ),
                titleSpacing: 20.0,
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 30.0,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                bodyText2: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.orange,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 30.0,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.black
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white , size: 20.0),
                backgroundColor: Colors.black38,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                actionsIconTheme: IconThemeData(color: Colors.white, size: 20.0),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.orange,
                ),
                titleSpacing: 20.0,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                bodyText2: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              scaffoldBackgroundColor: Colors.black38,
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
     ),
    );
  }
}
