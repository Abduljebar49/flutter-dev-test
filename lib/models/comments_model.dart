class Comment {
  final String avatarUrl;
  final String name;
  final String username;
  final String comment;
  final int replies;
  final int hours;
  final int commentCount;
  Comment({
    required this.avatarUrl,
    required this.name,
    required this.username,
    required this.comment,
    required this.replies,
    required this.hours,
    required this.commentCount,
  });
}