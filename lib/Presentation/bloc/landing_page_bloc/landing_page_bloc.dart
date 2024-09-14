import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/landing_page_bloc/landing_page_event.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/landing_page_bloc/landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial(tabIndex: 0)){
    on<LandingPageEvent>((event, emit ) {
      if(event is TabChange){
        emit(LandingPageInitial(tabIndex: event.tabIndex));
      }
  });
  }
}