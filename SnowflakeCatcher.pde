private Snowflake[] snowflakes;
void setup()
{
  //loadPixels();
  size(400, 400);
  background(0, 162, 255);
  snowflakes = new Snowflake[100];
  for(int i = 0; i < snowflakes.length; i++) {
    snowflakes[i] = new Snowflake();
  }
}
void draw()
{
  //background(0, 162, 255);
  for(int i = 0; i < snowflakes.length; i++) {
    snowflakes[i].erase();
    snowflakes[i].lookDown();
    snowflakes[i].move();
    snowflakes[i].wrap();
    snowflakes[i].show();
  }
}
void mouseDragged()
{
  stroke(151, 46, 46);
  strokeWeight(20);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
class Snowflake
{
  private int x;
  private int y;
  private boolean isMoving;
  public Snowflake()
  {
    x = (int)(Math.random() * 401);
    y = (int)(Math.random() * 401);
    isMoving = true;
  }
  public void show()
  {
    fill(144, 0, 255);
    //stroke(144, 0, 255);
    noStroke();
    ellipse(x, y, 10, 10);
  }
  public void lookDown()
  {
    if(y >= 0 && y <= 400){
      color c = get(x, y+6);
      //if(c != color(0, 162, 255) && c != color(144, 0, 255)) {
      if(c == color(151, 46, 46)) {
          isMoving = false;
      }
      else {
        isMoving = true;
      }    
      }
  }
  public void erase()
  {
    fill (0, 162, 255);
    noStroke();
    ellipse(x, y, 12, 12);
  }
  public void move()
  {
    if(isMoving == true) {
      y++;
    }
  }
  public void wrap()
  {
    if(y > 393) {
      y = 1;
      x = (int)(Math.random() * 401);
    }
  }
  public boolean getisMoving() {
    return isMoving;
  }
}

