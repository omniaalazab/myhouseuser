class SearchState {
  final String searchQuery;
  final bool isListening;
  final Map<String, dynamic>? userMap;
  final bool isLoading;
  final String error;

  SearchState({
    this.searchQuery = '',
    this.isListening = false,
    this.userMap,
    this.isLoading = false,
    this.error = '',
  });

  SearchState copyWith({
    String? searchQuery,
    bool? isListening,
    Map<String, dynamic>? userMap,
    bool? isLoading,
    String? error,
  }) {
    return SearchState(
      searchQuery: searchQuery ?? this.searchQuery,
      isListening: isListening ?? this.isListening,
      userMap: userMap ?? this.userMap,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
