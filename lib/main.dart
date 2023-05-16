import 'package:flutter/material.dart';
import 'package:portfolio/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Personal Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Product Sans',
        useMaterial3: true,
      ),
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
