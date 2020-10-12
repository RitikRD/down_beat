 class MenuDrawer {
 static List<Drawermenu> items = [
    Drawermenu(id: 1, isselected: 1, title: 'Discove'),
    Drawermenu(id: 2, isselected: 0, title: "Bands"),
    Drawermenu(id: 3, isselected: 0, title: "Places"),
    Drawermenu(id: 4, isselected: 0, title: "Accounts"),
    Drawermenu(id: 5, isselected: 0, title: "Settings"),
    Drawermenu(id: 6, isselected: 0, title: "Requests"),
  ];
}

class Drawermenu {
  int id;
  String title;
  int isselected;

  Drawermenu({
    this.id,
    this.title,
    this.isselected,
  });

}