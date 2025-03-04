import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/pages/application/bloc/application_event.dart';
import 'package:chaqchuq/app/pages/application/bloc/application_state.dart';



class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {

    ApplicationBloc() : super(ApplicationState()) {
        on<TriggerApplicationEvent>(_triggerApplicationEvent);
    }

    void _triggerApplicationEvent(TriggerApplicationEvent event, Emitter<ApplicationState> emit) async {
        emit(ApplicationState(index: event.index));
    }
}