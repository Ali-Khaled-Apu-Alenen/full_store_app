import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/di/dependency_injec.dart';
import 'package:ali_store/ui/bottom_bar/home/home.dart';
import 'package:ali_store/ui/bottom_bar/home/widget/home_pages_wrapper.dart';
import 'package:ali_store/ui/bottom_bar/favorite/favorite.dart';
import 'package:ali_store/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:ali_store/ui/bottom_bar/profile/profile.dart';
import 'package:ali_store/ui/bottom_bar/search/logic/cubit/search_cubit.dart';
import 'package:ali_store/ui/bottom_bar/search/search_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitialState(0));
  int currentIndex = 0;
  List<Widget> listPages = [
    HomePagesWrapper(initialRoute: RoutesName.home),
    BlocProvider(create: (_) => getIt<SearchCubit>(), child: SearchPage()),
    BlocProvider(create: (_) => getIt<HomeBloc>(), child: const FavoritePage()),
    ProfilePage(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomBarInitialState(currentIndex));
  }
}
