import 'package:flutter/material.dart';
import 'package:france_terme/widgets/sliding_segmented_home.dart';
import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';
import '../providers/data_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Launcher extends StatefulWidget {
  final DataProvider provider;
  const Launcher(this.provider, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  late final DataProvider provider;

  @override
  void initState() {
    super.initState();
    provider = widget.provider;
  }

  Future<Tuple2<bool, DateTime>> isUpdateNeeded() async {
    final Tuple2<bool, DateTime> dateInformations =
        await DataProvider.isUpToDate();
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

  Widget futureVerification() {
    return FutureBuilder(
        future: isUpdateNeeded(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final Tuple2<bool, DateTime> dateInformations =
                snapshot.requireData as Tuple2<bool, DateTime>;
            final bool isInit = provider.isInit();
            if (dateInformations.item1) {
              return FutureUpdate(provider, dateInformations.item2);
            } else if (!isInit) {
              return FutureInit(provider);
            } else {
              return SlidingSegmentedHome(provider);
            }
          } else {
            return Center(
                child: Column(children: [
              Text(AppLocalizations.of(context)!.searchUpdate),
              const CircularProgressIndicator()
            ]));
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return futureVerification();
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
            return const Text("Init error...");
          } else {
            return Center(
              child: Column(children: [
                Text(AppLocalizations.of(context)!.launchInformation),
                const CircularProgressIndicator(),
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
            return const Text("Update error...");
          } else {
            return Center(
              child: Column(children: [
                Text(AppLocalizations.of(context)!.updateInformation),
                const CircularProgressIndicator(),
              ]),
            );
          }
        }));
  }
}

class FutureDataProvider extends StatelessWidget {
  const FutureDataProvider({Key? key}) : super(key: key);
  Future<DataProvider> getProvider() async {
    Isar isar = await DataProvider.openIsar();
    return DataProvider(isar);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProvider(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            DataProvider provider = snapshot.requireData as DataProvider;
            return Launcher(provider);
          } else if (snapshot.hasError) {
            return Text(AppLocalizations.of(context)!.errorMessage);
          } else {
            return const CircularProgressIndicator();
          }
        }));
  }
}
