class Donut{
  String id;
  String type;
  String name;
  
  Donut(String id, String t, String n){
    this.id = id;
    this.type = t;
    this.name = n;
  }
  
  void display(){
    fill(255,0,255);
    text("id: "+ id + " , type: " + type + ", name: " + name, 20, height/2);
  }
}
