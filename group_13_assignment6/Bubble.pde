class Bubble {
  float x, y, vector_x, vector_y, move_up, still;
  boolean pop;
  
  public Bubble(float x, float y) {
    this.x = x;
    this.y = y;
    this.vector_x = 0;
    this.vector_y = 0;
    this.move_up = 50;
    this.still = 270 + (float) Math.random() * 200;
    this.pop = false;
  }
  
  public void update() {
    // Move up 
    if (this.move_up > 0) {
      this.vector_y -= 0.08;
      this.vector_x += (Math.random() - 0.5) * 0.18;
      this.move_up -= 1;
    }
    
    this.still -= 1;
    if (this.still <= 0) {
      this.pop();
    }
    
    // physics-based - bubble going against gravity and floating 
    this.y += vector_y;
    this.x += vector_x;
    this.vector_y += 0.01;  
    
    if (!this.pop) {
      fill(random(255), random(255), random(255));
      float shine = (float) Math.random() * move_up / 8 + 2.0;
      ellipse(this.x, this.y, shine, shine);
    }
  }
  
  private void pop() {
    this.pop = true;
  }
}
