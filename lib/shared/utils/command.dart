import 'package:flutter/material.dart';
import 'package:traveling_app/shared/utils/result.dart';

typedef CommandAction<T> = Future<Result<T>> Function();
typedef CommandActionWithArgs<T, A> = Future<Result<T>> Function(A);

abstract class _Command<T> extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  bool _completed = false;
  bool get completed => _completed;

  Result<T>? _result;
  Result<T>? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction<T> action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      _completed = true;
      notifyListeners();
    }
  }
}

class Command<T> extends _Command<T> {
  Command(this._action);

  final CommandAction<T> _action;

  Future<void> execute() async {
    await _execute(_action);
  }
}

class CommandWithArgs<T, A> extends _Command<T> {
  CommandWithArgs(this._action);

  final CommandActionWithArgs<T, A> _action;

  Future<void> execute(A args) async {
    await _execute(() => _action(args));
  }
}
