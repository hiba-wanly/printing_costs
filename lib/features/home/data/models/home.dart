class Home{
  dynamic username;
  dynamic userid;
  dynamic toperson;
  dynamic project;
  dynamic printer;
  dynamic time;
  dynamic material;
  dynamic quantity;
  dynamic price_or_order;
  dynamic date;
  dynamic total_price;
  dynamic finance;
  dynamic supervisor;
  dynamic membership;
  dynamic gain;
  dynamic risk;
  dynamic material_costs;
  dynamic owner;

  Home({
    this.username,
    this.userid,
    this.toperson,
    this.project,
    this.printer,
    this.time,
    this.material,
    this.quantity,
    this.price_or_order,
    this.date,
    this.total_price,
    this.finance,
    required this.supervisor,
    required this.membership,
    this.gain,
    this.risk,
    this.material_costs,
    this.owner,
});

  Map<String,dynamic> toJson(){
    return {
      "user_name":username,
      "user_id":userid,
      "to_perosn":toperson,
      "project":project,
      "printer":printer,
      "time":time,
      "material":material,
      "quantity":quantity,
      "price_or_order":price_or_order,
      "date":date,
      "total_price":total_price,
      "finance":finance,
      "supervisor":supervisor,
      "membership":membership,
      "gain":gain,
      "risk":risk,
      "material_costs":material_costs,
      "owner":owner
    };
  }

  Home.fromJson(Map<String ,dynamic> json) {
   username = json['user_name'];
   userid = json['user_id'];
   toperson = json['to_perosn'];
   project = json['project'];
   printer = json['printer'];
   time = json['time'];
   material = json['material'];
   quantity = json['quantity'];
   price_or_order = json['price_or_order'];
   date = json['date'];
   total_price = json['total_price'];
   finance = json['finance'];
   supervisor = json['supervisor'];
   membership = json['membership'];
   gain = json['gain'];
   risk = json['risk'];
  }

}