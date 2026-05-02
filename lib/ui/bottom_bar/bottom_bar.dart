import 'package:advanced_store_project/ui/bottom_bar/logic/cubit/bottom_bar_cubit.dart';
import 'package:advanced_store_project/core/di/dependency_injec.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        final cubit = context.read<BottomBarCubit>();
        return Scaffold(
          bottomNavigationBar: Builder(
            builder: (_) => BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      cubit.changeIndex(0);
                    },
                    child: Icon(Icons.home),
                  ),
                  MaterialButton(
                    onPressed: () {
                      cubit.changeIndex(1);
                    },
                    child: Icon(Icons.search),
                  ),
                  MaterialButton(
                    onPressed: () {
                      cubit.changeIndex(2);
                    },
                    child: Icon(Icons.favorite),
                  ),
                  MaterialButton(
                    onPressed: () {
                      cubit.changeIndex(3);
                    },
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
          ),
          body: cubit.listPages.elementAt(cubit.currentIndex),
        );
      },
    );
  }
}
