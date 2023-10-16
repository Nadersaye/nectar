part of 'auth_cubit.dart';

@immutable
abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

class ChangePasswordVizabilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccesState extends LoginStates {}

class LoginErrorState extends LoginStates {}
