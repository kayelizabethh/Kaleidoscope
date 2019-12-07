/*
I have corrected my previous submission and have 
included the ability to increase and decrease mirrors
 
 You have to start with three mirrors
 and pressing the UP key will increase the number of mirrors
 while pressing the DOWN key will decrease the number of mirrors
 
 pressing LEFT and RIGHT will increase and decrease the speed of the rotation
 
 the TAB key should stop the motion
 */

PImage old;
int mirrors = 10;
float angle = PI/mirrors;
PShape shape;
float radius;
float speed = .01;
float k = 0.01;

void setup() {
  size(500, 500, P2D);
  background(0);
  radius = min(width, height)/2;
  shape = createShape();
  old = loadImage("swirl.jpeg");
}

void draw() {
  background(0);
  kalediscope(mirrors);
}

void kalediscope(int mirrors) {
  angle = PI / mirrors;
  speed += k;
  shape = createShape();
  shape.beginShape(TRIANGLE);
  shape.texture(old);
  shape.noStroke();
  shape.vertex(0, 0, old.width/2, old.height/2);
  shape.vertex(cos(angle)*radius, sin(angle)*radius, cos(angle+speed)*radius+old.width/2, 
    sin(angle+speed)*radius+old.height/2);
  shape.vertex(cos(-angle)*radius, sin(-angle)*radius, cos(-angle+speed)*radius+old.width/2, 
    sin(-angle+speed)*radius+old.height/2);
  shape.endShape();
  translate(width/2, height/2);
  for (int i = 0; i < mirrors; i++) {
    rotate(angle*2);
    shape(shape);
  }
}

void keyPressed() {
  if (keyCode == RIGHT)
    k += .01;
  if (keyCode == LEFT)
    k -= .01;
  if (keyCode == TAB) 
    k = 0;
  //does not stop, only resets 
  if (keyCode == UP)
    mirrors += 1;
  if (keyCode == DOWN) {
    if (mirrors <= 3)
      mirrors = 3;
    else
      mirrors -= 1;
  }
  //kalediscope(mirrors);
}
