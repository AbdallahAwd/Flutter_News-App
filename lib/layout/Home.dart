import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/modules/search/search.dart';
import 'package:learning/shared/Cubit/Cubit.dart';
import 'package:learning/shared/Cubit/DarkCubit.dart';
import 'package:learning/shared/Cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context ,state) {},
      builder: (context ,state)
      {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text('NewsApp'),
            actions: [
              IconButton(onPressed: ()
              {
                Navigator.push(context , MaterialPageRoute(builder: (BuildContext context) => SearchScreen()));
              },
                  icon: Icon(Icons.search)),
              IconButton(onPressed: ()
              {
                NewsCubit.get(context).darkMode();
              },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.current_Index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current_Index,
            onTap: (index)
            {
              cubit.NavChange(index);
            },
            items: cubit.items,
          ),
        );
      },
    );
  }
}
