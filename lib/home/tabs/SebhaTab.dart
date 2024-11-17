import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله",
  ];
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(children: [
        Stack(alignment: Alignment.topCenter, children: [
          Image.asset("assets/images/head_of_seb7a.png"),
          Padding(
            padding: EdgeInsets.only(top: height * 0.086),
            child: Transform.rotate(
                angle: angle,
                child: Image.asset("assets/images/body_of_seb7a.png")),
          ),
        ]),
        SizedBox(
          height: height * 0.04,
        ),
        Text(
          AppLocalizations.of(context)!.numberOfTasbeeh,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.secondary,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            counter.toString(),
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: height * 0.04),
        InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            child: Text(
              "${azkar[index]}",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ]),
    );
  }

  ontap() {
    angle += 0.5;
    if (counter < 33) {
      counter++;
    } else {
      counter = 0;
      index++;
      if (index == azkar.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
