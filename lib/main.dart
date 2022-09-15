import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_solusidigital/blocs/getData/cubit/get_data_cubit.dart';
import 'package:test_solusidigital/screen/homePage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetDataCubit>(
          create: (context) => GetDataCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            textTheme: GoogleFonts.rubikTextTheme(textTheme).copyWith(
                bodyText1: GoogleFonts.rubik(textStyle: textTheme.bodyText1))),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
