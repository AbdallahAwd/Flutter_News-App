import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/shared/Cubit/Cubit.dart';
import 'package:learning/shared/Cubit/states.dart';
import 'package:learning/shared/compnents/component.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultTextFormFeild(
                      controller: controller,
                      KeyType: TextInputType.text,
                      pre: Icons.search,
                      HintText: 'Search',
                      submit: (value) {
                        if (formKey.currentState.validate())
                        {
                           NewsCubit.get(context).getsearchData(value:value);
                        }
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Nothing written';
                        }
                      }),
                 Expanded(child: DataHandler(list,isSearch: true))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
