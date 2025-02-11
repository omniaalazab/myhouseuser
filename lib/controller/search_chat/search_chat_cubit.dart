import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/search_chat/search_chat_state.dart';

import 'package:housemanuser/models/user_model.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class SearchCubit extends Cubit<SearchState> {
  final stt.SpeechToText _speech;

  SearchCubit()
      : _speech = stt.SpeechToText(),
        super(SearchState());

  void searchForUsers(String searchedUser) async {
    emit(state.copyWith(isLoading: true, error: '', userMap: null));
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final querySnapshot = await firebaseFirestore
          .collection('users')
          .where('userName', isEqualTo: searchedUser)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userMap = querySnapshot.docs.first.data();
        emit(state.copyWith(userMap: userMap, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false, error: 'User not found.'));
      }
    } catch (e) {
      log('Error searching for user: $e');
      emit(state.copyWith(isLoading: false, error: 'Error occurred.'));
    }
  }

  void startListening() async {
    bool available = await _speech.initialize(
      onStatus: (val) => log('onStatus: $val'),
      onError: (val) {
        log('onError: $val');
        if (val.errorMsg == 'error_no_match') {
          emit(state.copyWith(
              error: 'No speech match found. Please try again.'));
        }
      },
    );
    log('Microphone availability: $available');
    if (available) {
      emit(state.copyWith(isListening: true));
      _speech.listen(
        onResult: (val) {
          log(val.recognizedWords);
          emit(state.copyWith(searchQuery: val.recognizedWords));
        },
      );
    }
  }

  void stopListening() {
    emit(state.copyWith(isListening: false));
    _speech.stop();
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}

class SearchStatus {}

class SearchInitial extends SearchStatus {}

class SearchLoading extends SearchStatus {}

class SearchLoaded extends SearchStatus {
  final List<Users> users;
  SearchLoaded(this.users);
}

class SearchSuccess extends SearchStatus {
  final List<Users> users;
  SearchSuccess(this.users);
}

class SearchFailure extends SearchStatus {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}

class WrittenSearchCubit extends Cubit<SearchStatus> {
  WrittenSearchCubit() : super(SearchInitial());
  List<Users> foundedUsers = [];
  List<Users> resultUsersList = [];

  Future<void> getFirestoreDocuments() async {
    emit(SearchLoading());
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('userName')
          .get();
      foundedUsers = data.docs.map((doc) => Users.fromSnapshot(doc)).toList();
      emit(SearchLoaded(foundedUsers));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

  // Future<void> getTypeProduct(String typeProduct) async {
  //   emit(SearchLoading());
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('products')
  //         .where('type', isEqualTo: typeProduct)
  //         .get();

  //     foundedProduct =
  //         querySnapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //     emit(SearchLoaded(foundedProduct));
  //   } catch (e) {
  //     emit(SearchFailure(e.toString()));
  //   }
  // }

  void searchResultList(String query) {
    if (query.isEmpty) {
      resultUsersList = List.from(foundedUsers);
    } else {
      resultUsersList = foundedUsers
          .where((users) =>
              users.userName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    if (resultUsersList.isNotEmpty) {
      emit(SearchSuccess(resultUsersList));
    } else {
      emit(SearchFailure('No User found'));
    }
  }
}
