class UserProfileDetailsEntity {
  final String userId;
  final String userName;
  final String email;
  final String? profileImageUrl;

  UserProfileDetailsEntity({
    required this.userId,
    required this.userName,
    required this.email,
    this.profileImageUrl,
  });
  toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }
}
