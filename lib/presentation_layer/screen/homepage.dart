// ignore_for_file: unused_import, must_be_immutable

import 'package:calculate/busines-logic_layer/cubit/character_cubit.dart';
import 'package:calculate/router/generate_route.dart';
import 'package:flutter/material.dart';
import 'package:calculate/presentation_layer/widget/custombtn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) => Scaffold(
              backgroundColor: Colors.deepPurple[100],
              body: Center(
                  child: Column(children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(CharacterCubit.get(context).question),
                          Text(CharacterCubit.get(context).answer)
                        ],
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 100,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount:
                                  CharacterCubit.get(context).calculate.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Custombtn(
                                      func: () {
                                        CharacterCubit.get(context)
                                            .removeall(context);
                                      },
                                      text:
                                          '${CharacterCubit.get(context).calculate[index]}',
                                      color: Colors.green,
                                      textcolor: Colors.white);
                                } else if (index == 1) {
                                  return Custombtn(
                                      func: () {
                                        CharacterCubit.get(context)
                                            .dell(context);
                                      },
                                      text:
                                          '${CharacterCubit.get(context).calculate[index]}',
                                      color: Colors.red,
                                      textcolor: Colors.white);
                                } else if (index ==
                                    CharacterCubit.get(context)
                                            .calculate
                                            .length -
                                        1) {
                                  return Custombtn(
                                      func: () {
                                        CharacterCubit.get(context)
                                            .clacuateanswer(context);
                                      },
                                      text:
                                          '${CharacterCubit.get(context).calculate[index]}',
                                      color: Colors.red,
                                      textcolor: Colors.white);
                                } else {
                                  return Custombtn(
                                    func: () {
                                      CharacterCubit.get(context).questions(
                                          CharacterCubit.get(context)
                                              .calculate[index]);
                                    },
                                    text:
                                        '${CharacterCubit.get(context).calculate[index]}',
                                    color: CharacterCubit.get(context)
                                            .isoperate(
                                                CharacterCubit.get(context)
                                                    .calculate[index])
                                        ? Colors.purple
                                        : Colors.purple[50],
                                    textcolor: CharacterCubit.get(context)
                                            .isoperate(
                                                CharacterCubit.get(context)
                                                    .calculate[index])
                                        ? Colors.white
                                        : Colors.purple,
                                  );
                                }
                              }),
                        )))
              ])),
            ));
  }
}
