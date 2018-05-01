import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Table t1;
float[] total_pop;
float[] median_age;
float[] avg_house_size;

PeasyCam cam;

void setup() {
  size(1200,1000,P3D);
  noSmooth();
  t1 = loadTable("2010_pop_zip_code.csv", "header");

  total_pop = new float[t1.getRowCount()];
  median_age = new float[t1.getRowCount()];
  avg_house_size = new float[t1.getRowCount()];
  
  line(0,0,1200,0);
  line(0,0,0,100);
  int count = 0;
  
  for (TableRow row : t1.rows()) {
    total_pop[count] = t1.getFloat(count,"Total Population")/100;
    median_age[count] = t1.getFloat(count,"Median Age")*10;
    avg_house_size[count] = t1.getFloat(count,"Average Household Size")*-100;
    
    
    count++;
    
  }
  
  cam = new PeasyCam(this, 500,500,0, 1000);
}
  
void draw() {
  background(0);
  stroke(255);
  
  int count = 0;
  
  
  for (int i = 0; i < t1.getRowCount(); i++) {
    int k = i+1;
    if(k>= t1.getRowCount()){
      break;
    }
    else{
    line(total_pop[i],median_age[i],avg_house_size[i],total_pop[k],median_age[k],avg_house_size[k]); 
    }
  }
  textSize(32);
  text("Total Population (hundreds)", 600, 50, 0);
  text("Median Age (scaled by ten)", 50,800, 0);
  text("Average Household Size (scaled by one hundred)", 50,0,-500);
  for(int i = 0; i<1200;i++){
    if(i%20 == 0){
      line(i, 0, i, 10);
      textSize(8);
      
      text(count*20,i,20,0);
      count++;
    }
  }
  count = 0;
  for(int i = 0; i<1000;i++){
    if(i%20 == 0){
      line(0, i, 10, i);
      textSize(8);
      
      text(count*20,20,i,0);
      count++;
    }
  }
  count = 0;
  for(int i =-1000; i<0;i++){
    if(i%10 == 0){
      line(0, 0, i, 10,0,i);
      textSize(8);
      
      text(1000-count*10,20,0,i);
      count++;
    }
  }
}
