import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/common/state_render/state_render.dart';

abstract class FlowState {
  StateRenderType stateRenderTypeFun();

  String messageFun();
}

// loading state (pop up, full screen)
class LoadingState extends FlowState {
  StateRenderType stateRenderType;
  String? message;

  LoadingState({required this.stateRenderType, this.message = ""});

  @override
  StateRenderType stateRenderTypeFun() => stateRenderType;

  @override
  String messageFun() => message ?? "";
}

// error state (pop up, full screen)
class ErrorState extends FlowState {
  StateRenderType stateRenderType;
  String message;

  ErrorState(this.stateRenderType, this.message);

  @override
  StateRenderType stateRenderTypeFun() => stateRenderType;

  @override
  String messageFun() => message;
}

// full screen Empty state
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  StateRenderType stateRenderTypeFun() => StateRenderType.fullScreenEmptyState;

  @override
  String messageFun() => message;
}

// full screen content state
class ContentState extends FlowState {
  ContentState();

  @override
  StateRenderType stateRenderTypeFun() => StateRenderType.contentState;

  @override
  String messageFun() => "";
}

extension FlowStateExtension on FlowState {
  Widget flowStateWidget(
    BuildContext context,
    Function retryActionFunction,
    Widget contentScreenWidget,
  ) {
    switch (runtimeType) {
      // loading state (pop up, full screen)
      case LoadingState:
        {
          if (stateRenderTypeFun() == StateRenderType.popUpLoadingState) {
            showPopUpFunction(
              retryActionFunction: retryActionFunction,
              message: messageFun(),
              stateRenderType: stateRenderTypeFun(),
              context: context,
            );
            return contentScreenWidget;
          } else {
            return StateRender(
              stateRenderType: stateRenderTypeFun(),
              message: messageFun(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      // error state (pop up, full screen)
      case ErrorState:
        {
          dismissDialog(context);
          if (stateRenderTypeFun() == StateRenderType.popUpErrorState) {
            showPopUpFunction(
              retryActionFunction: retryActionFunction,
              message: messageFun(),
              stateRenderType: stateRenderTypeFun(),
              context: context,
            );
            return contentScreenWidget;
          } else {
            return StateRender(
              stateRenderType: stateRenderTypeFun(),
              message: messageFun(),
              retryActionFunction: retryActionFunction,
            );
          }
        }

      case EmptyState:
        {
          return StateRender(
            stateRenderType: stateRenderTypeFun(),
            message: messageFun(),
            retryActionFunction: () {},
          );
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  void showPopUpFunction({
    required Function retryActionFunction,
    required String message,
    required StateRenderType stateRenderType,
    required BuildContext context,
  }) {
    return WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (context) => StateRender(
          message: message,
          stateRenderType: stateRenderType,
          retryActionFunction: retryActionFunction,
        ),
      ),
    );
  }

  bool _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)!.isCurrent != true;

  void dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.pop(context);
    }
  }
}
