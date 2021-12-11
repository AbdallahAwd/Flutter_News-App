abstract class NewsStates{}

class initialState extends NewsStates{}

class ButtomNavChange extends NewsStates{}

class BusinessSucessState extends NewsStates{}
class BusinessErrorState extends NewsStates {
  final String error;

  BusinessErrorState(this.error);
}
class BusinessLoadingState extends NewsStates{}

class SciecnceSucessState extends NewsStates{}
class SciecnceErrorState extends NewsStates {
  final String error;

  SciecnceErrorState(this.error);
}
class SciecnceLoadingState extends NewsStates{}

class SportsSucessState extends NewsStates{}
class SportsErrorState extends NewsStates {
  final String error;

  SportsErrorState(this.error);
}
class SportsLoadingState extends NewsStates{}

class SearchSucessState extends NewsStates{}
class SearchErrorState extends NewsStates {
  final String error;

  SearchErrorState(this.error);
}
class SearchLoadingState extends NewsStates{}

class Darkmode extends NewsStates{}
