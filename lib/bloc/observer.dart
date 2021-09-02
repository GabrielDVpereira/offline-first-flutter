import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  // ignore: unnecessary_overrides
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
  }

  @override
  // ignore: unnecessary_overrides
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
