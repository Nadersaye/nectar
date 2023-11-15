part of 'manage_favourite_cubit.dart';

@immutable
sealed class ManageFavouriteState {}

final class ManageFavouriteInitial extends ManageFavouriteState {}

final class ManageFavouriteChanged extends ManageFavouriteState {}
