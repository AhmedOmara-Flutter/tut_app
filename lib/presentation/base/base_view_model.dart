import 'package:tut_app/app/app_imports.dart';

abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {
  final StreamController _inputStreamBuilder =
      StreamController<FlowState>.broadcast();

  @override
  void dispose() {
    _inputStreamBuilder.close();
  }

  @override
  Sink get inputState => _inputStreamBuilder.sink;

  @override
  Stream<FlowState> get outputState => _inputStreamBuilder.stream.map((event)=>event);
}

mixin BaseViewModelInputs {
  void start();

  void dispose();

  Sink get inputState;
}

mixin BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
