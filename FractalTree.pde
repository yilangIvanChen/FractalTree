private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;
PImage bro;

public void setup() {   
  size(640, 640);
  bro = loadImage("bro.png");
  noLoop();
} 

public void draw() {   
  background(0);    
  line(320, 540, 320, 440);  
  stroke(0, 255, 0);  
  drawBranches(320, 440, 100, 3*PI/2);
  image(bro, 400, 410, width/3, height/3);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(6);
  circle(500,510,180);
} 

public void drawBranches(int x, int y, double branchLength, double angle) {
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  if (branchLength < smallestBranch) {
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);
  } else {
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);
    drawBranches(endX1, endY1, branchLength*fractionLength, angle1);
    drawBranches(endX2, endY2, branchLength*fractionLength, angle2);
  }
} 
