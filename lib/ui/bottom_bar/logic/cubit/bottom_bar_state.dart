part of 'bottom_bar_cubit.dart';


sealed class BottomBarState {
  const BottomBarState();
}

class BottomBarInitialState extends BottomBarState {
  final int index;
  const BottomBarInitialState(this.index);
}
