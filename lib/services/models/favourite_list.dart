class FavouriteListModel {
  String name;
  String iconPath;
  String people;
  bool boxIsSelected;

  FavouriteListModel({
    required this.name,
    required this.iconPath,
    required this.people,
    required this.boxIsSelected,

  });

  static List <FavouriteListModel> getFavouriteList() {
    List <FavouriteListModel> favoriteList = [];

    favoriteList.add(
        FavouriteListModel(
          name: 'Education feedback',
          iconPath: 'assets/icons/list_icon_1.png',
          people: 'assets/icons/avatar_1.png',
          boxIsSelected: false,
        )
    );

    favoriteList.add(
        FavouriteListModel(
          name: 'Code generation',
          iconPath: 'assets/icons/list_icon_2.png',
          people: 'assets/icons/avatar_1.png',
          boxIsSelected: false,
        )
    );

    favoriteList.add(
        FavouriteListModel(
          name: 'photo retouch',
          iconPath: 'assets/icons/list_icon_3.png',
          people: 'assets/icons/avatar_2.png',
          boxIsSelected: false,
        )
    );
    return favoriteList;
  }
}
