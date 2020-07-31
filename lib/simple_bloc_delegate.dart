import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class SimpleBlocDelegate extends BlocObserver {
  final Logger log = Logger('BlocDelegate');
  @override
  void onEvent(Bloc bloc, Object event) {
    log.fine('-> onEvent: $event');
    super.onEvent(bloc, event);
  }

  // @override
  // void onChange(Cubit cubit, Change change) {
  //   log.fine('-> onChange: $change');
  //   super.onChange(cubit, change);
  // }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    log.fine('=> onError: $error');
    super.onError(cubit, error, stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.fine('-> onTransition: $transition');
    super.onTransition(bloc, transition);
  }
}
