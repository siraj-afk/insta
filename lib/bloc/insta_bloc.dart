import 'package:bloc/bloc.dart';
import 'package:insta/repositery/model/instamodel.dart';
import 'package:meta/meta.dart';

import '../repositery/api/instaapi/instaapinew.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  late InstaModel instamodel;
  InstaApi instaApi=InstaApi();
  InstaBloc() : super(InstaInitial()) {
    on<InstaEvent>((event, emit)  async{
      emit(Instablocloading());
      try{

        instamodel = await instaApi.getInsta();
        emit(Instablocloaded());
      } catch(e){
        print(e);
        emit(Instablocerror());}
      // TODO: implement event handler
    });
  }
}
