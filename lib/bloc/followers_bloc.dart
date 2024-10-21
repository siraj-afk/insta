import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repositery/api/instaapi/instaapinew.dart';
import '../repositery/model/Followers.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  late Followers followers;
  InstaApi instaApi=InstaApi();
  FollowersBloc() : super(FollowersInitial()) {
    on<FollowersEvent>((event, emit)async {
      emit(Followersblocloading());
      try{

       followers = await instaApi.getFollowersmodel();
        emit(Followersblocloaded());
      } catch(e){
        print(e);
        emit(Followersblocerror());}
      // TODO: implement event handler
    });
  }
}
