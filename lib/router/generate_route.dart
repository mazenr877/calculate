import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculate/busines-logic_layer/cubit/character_cubit.dart';
import 'package:calculate/constant/string.dart';
import 'package:calculate/presentation_layer/screen/homepage.dart';

class AppRouter {
// // late Repositry repositry;
// // late CharacterCubit charactercubit;
//   AppRouter(){
//   // repositry = Repositry(ModelService());
//   // charactercubit = CharacterCubit(repositry);
//   }
  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigatorRouter.mypage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharacterCubit(),
                  child: const Home(),
                ));
    }
  }
}
