import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repositery/api/instaapi/instaapinew.dart';
import '../repositery/model/postmodel.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late Post posts;
  InstaApi instaApi=InstaApi();
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      emit(Postblocloading());
      try{

       posts= await instaApi.getPostmodel();
        emit(Postblocloaded());
      } catch(e){
        print(e);
        emit(Postblocerror());}
      // TODO: implement event handler
    });
  }
}
