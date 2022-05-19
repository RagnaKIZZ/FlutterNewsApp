import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'injector.config.dart';

final GetIt _getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureDependencies() async {
  $initGetIt(_getIt);
}
