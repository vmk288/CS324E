ArrayList<Listing> myListings;
ArrayList<Donut> myDonuts;


void setup(){
  size(1000, 500);
  background(255);
 
  //XML
  XML root = loadXML("ebay.xml");
  XML[] listings = root.getChildren("listing");
  myListings = new ArrayList<Listing>();
  for(XML l: listings){
    String s = l.getChild("seller_info").getChild("seller_name").getContent();
    String sh = l.getChild("shipping_info").getContent();
    String a = l.getChild("auction_info").getChild("current_bid").getContent();
    String d = l.getChild("item_info").getChild("description").getContent();
    Listing listing = new Listing(s, sh, a, d);
    myListings.add(listing);   
  }

  //JSON
  JSONArray donuts = loadJSONArray("donuts.js");
  myDonuts = new ArrayList<Donut>();
  println(donuts.size());
  for(int i = 0; i < donuts.size(); i++){
     JSONObject myDonut = donuts.getJSONObject(i);
     String id = myDonut.getString("id");
     String type = myDonut.getString("type");
     String name = myDonut.getString("name");
     Donut newDonut = new Donut(id, type, name);
     myDonuts.add(newDonut);
  }
}

void draw(){
  myListings.get(1).display();
  myDonuts.get(1).display();
  
}
