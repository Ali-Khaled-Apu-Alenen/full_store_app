import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/di/dependency_injec.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/home.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/widget/home_pages_wrapper.dart';
import 'package:advanced_store_project/ui/bottom_bar/search/logic/cubit/search_cubit.dart';
import 'package:advanced_store_project/ui/bottom_bar/search/search_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'bottom_bar_state.dart';


class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitialState(0));
  int currentIndex = 0;
  List<Widget> listPages = [
    HomePagesWrapper(initialRoute: RoutesName.home),
    BlocProvider(
      create: (_) => getIt<SearchCubit>(),
      child: SearchPage(),
    ),
    Container(),
    Container(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomBarInitialState(currentIndex));
  }
}
