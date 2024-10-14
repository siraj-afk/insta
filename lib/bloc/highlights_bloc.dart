import 'package:bloc/bloc.dart';
import 'package:insta/repositery/api/instaapi/instaapinew.dart';
import 'package:insta/repositery/model/highlights.dart';
import 'package:meta/meta.dart';

part 'highlights_event.dart';
part 'highlights_state.dart';

class HighlightsBloc extends Bloc<HighlightsEvent, HighlightsState> {
  late Highlights highlights;
  InstaApi instaApi=InstaApi();
  HighlightsBloc() : super(HighlightsInitial()) {
    on<HighlightsEvent>((event, emit) async {
      emit(Highlightsblocloading());
      try{

        highlights = await instaApi.getHighlights();
        emit(Highlightsblocloaded());
      } catch(e){
        print(e);
        emit(Highlightsblocerror());}
      // TODO: implement event handler
    });
  }
}
