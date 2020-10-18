class GenerationBridgeUser {
  String email;
  String name;
  String age;
  String city;
  String nickName;
  String profileImageURL;
  String profileMessage;
  String type;
  List<GenerationBridgeUser> friends;
  List<String> hobby;
  List<String> personality;

  GenerationBridgeUser({Map<String, dynamic> generationBridgeUser}) {
    this.email = generationBridgeUser['email']?.toString();
    this.name = generationBridgeUser['name']?.toString();
    this.age = generationBridgeUser['age']?.toString();
    this.city = generationBridgeUser['city']?.toString();
    this.nickName = generationBridgeUser['nickName']?.toString();
    this.profileImageURL = generationBridgeUser['profileImageURL']?.toString();
    this.profileMessage = generationBridgeUser['profileMessage']?.toString();
    this.type = generationBridgeUser['type']?.toString();
    this.friends = friends = List<GenerationBridgeUser>();
  }

  void addFriend(GenerationBridgeUser friend) {
    this.friends.add(friend);
  }

  void removeFriend(GenerationBridgeUser friend) {
    this.friends.remove(friend);
  }
}
