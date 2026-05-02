import 'package:advanced_store_project/core/constatnt/routes_name.dart';
import 'package:advanced_store_project/core/di/dependency_injec.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/home.dart';
import 'package:advanced_store_project/ui/bottom_bar/home/logic/bloc/home_bloc.dart';
import 'package:advanced_store_project/ui/bottom_bar/items_page/items_page.dart';
import 'package:advanced_store_project/ui/bottom_bar/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePagesWrapper extends StatelessWidget {
  final String initialRoute;
  const HomePagesWrapper({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<HomeBloc>(),
    child: Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutesName.home:
            return MaterialPageRoute(
              builder: (context) => const Home(),
            );
          case RoutesName.items:
            final categoryId = settings.arguments as int?;
            return MaterialPageRoute(
              builder: (context) => ItemsPage(categoryId: categoryId ?? 0),
            );
          // case RoutesName.search:
          //   return MaterialPageRoute(
          //     builder: (context) => SearchPage(),
          //   );
          default:
            return MaterialPageRoute(
              builder: (context) => const Home(),
            );
        }
      },
      initialRoute: initialRoute,
    ),
    );
  }
}