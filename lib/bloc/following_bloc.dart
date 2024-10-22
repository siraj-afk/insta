import 'package:bloc/bloc.dart';
import 'package:insta/repositery/model/Followingmodel.dart';
import 'package:meta/meta.dart';

import '../repositery/api/instaapi/instaapinew.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  late Following following;
  InstaApi instaApi=InstaApi();
  FollowingBloc() : super(FollowingInitial()) {
    on<fetchFollowingEvent>((event, emit) async {
      emit(Followingblocloading());
      try{

        following = await instaApi.getFollowingmodel(event.id);
        emit(Followingblocloaded());
      } catch(e){
        print(e);
        emit(Followingblocerror());}
      // TODO: implement event handler
    });
  }
}
