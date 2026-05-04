import 'package:ali_store/core/constatnt/languages.dart';
import 'package:ali_store/core/constatnt/routes_name.dart';
import 'package:ali_store/core/routes/app_routes.dart';
import 'package:ali_store/core/routes/navigation_extentions.dart';
import 'package:ali_store/ui/translations/cubit/translation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class TranslationPage extends StatefulWidget {
  TranslationPage({Key? key}) : super(key: key);

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Choose Language").tr(),
            SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
                minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                context.read<TranslationCubit>().changeLanguage(
                  context,
                  Languages.arabic,
                );
                context.pushNamedPage(RoutesName.login);
              },
              child: Text("Arabic", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
                minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                context.read<TranslationCubit>().changeLanguage(
                  context,
                  Languages.english,
                );
                context.pushNamedPage(RoutesName.login);
              },
              child: Text("English", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
