abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates {}

class GetSourcesSuccessState extends HomeStates {}

class GetSourcesErrorState extends HomeStates {}

class GetNewsLoadingState extends HomeStates {}

class GetNewsSuccessState extends HomeStates {}

class GetNewsErrorState extends HomeStates {}

class HomeChangeSource extends HomeStates {}

class HomeChangeCategory extends HomeStates {}
