import 'package:flutter/material.dart';
import 'package:france_termes/widgets/sliding_segmented_home.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';
import 'package:tuple/tuple.dart';
import '../providers/data_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget unexpectedError(BuildContext context) {
  return Center(child: Text(AppLocalizations.of(context)!.errorMessage));
}

class Launcher extends StatefulWidget {
  final DataProvider dataProvider;
  const Launcher(this.dataProvider, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  late final DataProvider dataProvider;

  @override
  void initState() {
    super.initState();
    dataProvider = widget.dataProvider;
  }

  Future<Tuple2<bool, DateTime>> _isUpdateNeeded() async {
    final Tuple2<bool, DateTime> dateInformations =
        await dataProvider.isUpToDateLazy();
    bool updateNeeded = false;
    if (!dateInformations.item1) {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.updateQuestion),
              actions: [
                TextButton(
                    onPressed: () {
                      updateNeeded = true;
                      Navigator.pop(context, false);
                    },
                    child: Text(AppLocalizations.of(context)!.updateYes)),
                TextButton(
                    onPressed: () {
                      updateNeeded = false;
                      Navigator.pop(context, false);
                    },
                    child: Text(AppLocalizations.of(context)!.updateNo))
              ],
            );
          });
    }
    return Tuple2(updateNeeded, dateInformations.item2);
  }

  Widget _futureVerification() {
    return FutureBuilder(
        future: _isUpdateNeeded(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final Tuple2<bool, DateTime> dateInformations =
                snapshot.requireData as Tuple2<bool, DateTime>;
            final bool isInit = dataProvider.isInitInOkVersion();
            if (dateInformations.item1) {
              return FutureUpdate(dataProvider, dateInformations.item2);
            } else if (!isInit) {
              return FutureInit(dataProvider);
            } else {
              return SlidingSegmentedHome(dataProvider);
            }
          } else {
            return Center(
                child: Column(children: [
              Text(AppLocalizations.of(context)!.searchUpdate),
              ThemeConstants.coloredCircularProgressIndicator(context)
            ]));
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return _futureVerification();
  }
}

class FutureInit extends StatelessWidget {
  final DataProvider provider;

  const FutureInit(this.provider, {Key? key}) : super(key: key);

  Future<bool> _initEnd() async {
    await provider.updateFromAsset();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initEnd(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SlidingSegmentedHome(provider);
          } else if (snapshot.hasData) {
            return unexpectedError(context);
          } else {
            return Center(
              child: Column(children: [
                Text(AppLocalizations.of(context)!.launchInformation),
                ThemeConstants.coloredCircularProgressIndicator(context),
              ]),
            );
          }
        }));
  }
}

class FutureUpdate extends StatelessWidget {
  final DataProvider provider;
  final DateTime lastVersion;
  const FutureUpdate(this.provider, this.lastVersion, {Key? key})
      : super(key: key);

  Future<bool> _updateEnd(DateTime lastVersion) async {
    await provider.updateFromDownload(lastVersion);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _updateEnd(lastVersion),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SlidingSegmentedHome(provider);
          } else if (snapshot.hasData) {
            return unexpectedError(context);
          } else {
            return Center(
              child: Column(children: [
                Text(AppLocalizations.of(context)!.updateInformation),
                ThemeConstants.coloredCircularProgressIndicator(context),
              ]),
            );
          }
        }));
  }
}
