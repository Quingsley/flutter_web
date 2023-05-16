import 'package:flutter/material.dart';
import 'package:portfolio/styles/colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorMessage});

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            PersonalPortfolioColors.errorBgTop,
            PersonalPortfolioColors.errorBgBottom,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.warning,
                    size: 80, color: PersonalPortfolioColors.errorIcon),
                const Text('Error!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(errorMessage,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 30, color: Colors.white)),
                )
              ]),
        ),
      ),
    );
  }
}
