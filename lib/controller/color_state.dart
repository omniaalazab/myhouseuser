import 'package:flutter/material.dart';

abstract class StateColor {
  Color getColor();
}

class PendingStateColor implements StateColor {
  @override
  Color getColor() => Colors.red;
}

class CompletedStateColor implements StateColor {
  @override
  Color getColor() => Colors.green;
}

class OngoingStateColor implements StateColor {
  @override
  Color getColor() => Colors.orange;
}

class UnknownStateColor implements StateColor {
  @override
  Color getColor() => Colors.grey;
}

/////////
class StateColorFactory {
  static final Map<String, StateColor> _stateColorMap = {
    'Pending': PendingStateColor(),
    'completed': CompletedStateColor(),
    'on going': OngoingStateColor(),
  };

  static StateColor getStateColor(String state) {
    return _stateColorMap[state] ?? UnknownStateColor();
  }
}
