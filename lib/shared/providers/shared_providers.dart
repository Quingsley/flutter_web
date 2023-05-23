import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/welcome/presentation/pages/welcome.page.dart';
import 'package:portfolio/services/localstorage.service.dart';
import 'package:portfolio/shared/repositories/database_provider.dart';
import 'package:portfolio/shared/repositories/idb_provider.dart';
import 'package:portfolio/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

final pageColorProvider = StateProvider<LinearGradient>(
    (ref) => PersonalPortfolioColors.pageColor[WelcomePage.route]!);

final bgPageRouteProvider = StateProvider<String>((ref) {
  return WelcomePage.route;
});

final firebaseDbInstanceProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final dbProvider = Provider<IDBProvider>(
  (ref) {
    return DatabaseProvider(ref);
  },
);

final sharedPrefsInstanceProvider =
    Provider((ref) => SharedPreferences.getInstance());

final webLocalStorageProvider = Provider((ref) => WebLocalStorage(ref));
