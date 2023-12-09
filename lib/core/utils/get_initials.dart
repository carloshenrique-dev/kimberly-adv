String getInitials(String name) {
  List<String> words = name.split(' ');
  String initials = '';

  for (String word in words) {
    if (word.isNotEmpty) {
      initials += word[0].toUpperCase();
    }
  }

  return initials;
}
