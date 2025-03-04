import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/pages/welcome/bloc/welcome_event.dart';
import 'package:chaqchuq/app/pages/welcome/bloc/welcome_state.dart';



class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
    WelcomeBloc() : super(WelcomeState()) {
        print("Welcome bloc");
        on<WelcomeEvent>(_welcomeEvent);
    }

    void _welcomeEvent(WelcomeEvent event, Emitter<WelcomeState> emit) async{
        emit(WelcomeState(page: state.page));
    }
}
