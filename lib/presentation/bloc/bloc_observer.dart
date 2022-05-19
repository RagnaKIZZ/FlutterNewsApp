import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    developer.log('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
