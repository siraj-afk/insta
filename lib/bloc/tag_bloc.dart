import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repositery/api/instaapi/instaapinew.dart';
import '../repositery/model/tagmodel.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  late Tag tags;
  InstaApi instaApi=InstaApi();
  TagBloc() : super(TagInitial()) {
    on<fetchTagEvent>((event, emit) async {
      emit(Tagblocloading());
      try{

       tags= await instaApi.getTagmodel(event.id);
        emit(Tagblocloaded());
      } catch(e){
        print(e);
        emit(Tagblocerror());}
      // TODO: implement event handler
    }
      // TODO: implement event handler
    );
  }
}
