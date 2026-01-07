abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {}

mixin BaseViewModelInputs {
  void start();

  void dispose();
}

mixin BaseViewModelOutputs {}
