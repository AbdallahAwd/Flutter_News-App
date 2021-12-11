import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/modules/Business/business.dart';
import 'package:learning/modules/science/science.dart';
import 'package:learning/modules/sports/sports.dart';
import 'package:learning/shared/Cubit/states.dart';
import 'package:learning/shared/networking/lacal/cacheHelper.dart';
import 'package:learning/shared/networking/remote/DioHelper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(initialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items =
  [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports',
    ),
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];
  int current_Index = 0;

  void NavChange(int index)
  {
    current_Index = index;
    emit(ButtomNavChange());
  }

  List<dynamic> business =[];
  void getData()
  {
    emit(BusinessLoadingState());
    DioHelper.getData
      (
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'business',
          'apiKey':'1920d52d24304e8da5ed7d321c68be2d',
        }).then((value)
      {
        business = value.data['articles'];
        emit(BusinessSucessState());
       }).catchError((onError)
    {
      print ('Error is ${onError.toString()}');
      emit(BusinessErrorState(onError));
    });
  }

  List<dynamic> science =[];
  void getScienceData()
  {
    emit(SciecnceLoadingState());
    DioHelper.getData
      (
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'science',
          'apiKey':'1920d52d24304e8da5ed7d321c68be2d',
        }).then((value)
      {
        science = value.data['articles'];
        emit(SciecnceSucessState());
       }).catchError((onError)
    {
      print ('Error is ${onError.toString()}');
      emit(SciecnceErrorState(onError));
    });
  }
  List<dynamic> sports =[];
  void getSportsData()
  {
    emit(SportsLoadingState());
    DioHelper.getData
      (
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'1920d52d24304e8da5ed7d321c68be2d',
        }).then((value)
      {
        sports = value.data['articles'];
        emit(SportsSucessState());
       }).catchError((onError)
    {
      print ('Error is ${onError.toString()}');
      emit(SportsErrorState(onError));
    });

  }List<dynamic> search =[];
  void getsearchData({value})
  {
    search =[];
    emit(SearchLoadingState());
    DioHelper.getData
      (
        url: 'v2/top-headlines',
        query:
        {
          'q':'$value',
          'apiKey':'1920d52d24304e8da5ed7d321c68be2d',
        }).then((value)
      {
        search = value.data['articles'];
        emit(SearchSucessState());
       }).catchError((onError)
    {
      print ('Error is ${onError.toString()}');
      emit(SearchErrorState(onError));
    });
  }
  bool isDark = false;
  void darkMode({bool shredDark})
  {
    if(shredDark!=null)
    {
      isDark = shredDark;
      emit(Darkmode());
    }
    else
      {
      isDark = !isDark;
      CacheHelper.setData(Key: 'isDark', isDark: isDark).then((value) {
        emit(Darkmode());
      });
    }
  }
}