part of 'cubits_cubit.dart';

@immutable
sealed class CubitsState {}

final class CubitsInitial extends CubitsState {}

class NewsBottomNav extends CubitsState{}

class NewsGetBusinessLoadingState extends CubitsState{}
class NewsGetBusinessSuccessState extends CubitsState{}
class NewsGetBusinessErrorState extends CubitsState
{
  late final String error;
NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLoadingState extends CubitsState{}
class NewsGetSportsSuccessState extends CubitsState{}
class NewsGetSportsErrorState extends CubitsState
{
  late final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetScienceLoadingState extends CubitsState{}
class NewsGetScienceSuccessState extends CubitsState{}
class NewsGetScienceErrorState extends CubitsState
{
  late final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetSearchLoadingState extends CubitsState{}
class NewsGetSearchSuccessState extends CubitsState{}
class NewsGetSearchErrorState extends CubitsState
{
  late final String error;
  NewsGetSearchErrorState(this.error);
}

class ChangeAppMode extends CubitsState{}
