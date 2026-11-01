import 'package:electronic_ptoject/Core/Routes/app_routes.dart';
import 'package:electronic_ptoject/Core/Theme/Cubit/them_Cubit.dart';
import 'package:electronic_ptoject/Core/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'Features/Products/Data/Datasource/product_data_sources.dart';
import 'Features/Products/Data/Repositories/product_repository.dart';
import 'Features/Products/Presentation/Bloc/product_bloc/product_bloc.dart';
import 'Features/Products/Presentation/Bloc/product_bloc/product_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) {
            final dataSources = ProductDataSources();
            final repository = ProductRepository(dataSources);
            final bloc = ProductBloc(repository);

            bloc.add(FetchProductEvent());

            return bloc;
          },
        ),
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
        BlocProvider<ThemCubit>(create: (context) => ThemCubit()),
      ],
      child: BlocBuilder<ThemCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRoutes.appRouter,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state == ThemeMode.light
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
