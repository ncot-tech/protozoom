ZoomRect[][] rectangles;
float angle;
float scaleValue;
float rotateScale;
float rotateStep;
float maxScale;

void setup()
{
  //fullScreen(2);
  size (500,500);
  rectMode(CENTER);
  noStroke();
  
  rectangles = new ZoomRect[5][5];
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 5; x++) {
      rectangles[x][y] = new ZoomRect(width / 5, height / 5);
    }
  }
  scaleValue = 0.1;
  angle = 0;
  maxScale = 2.0;
  rotateStep = 1;
  rotateScale = maxScale / (360 / rotateStep); 
}

void drawZoomSquares()
{
  translate(width/2, height/2);
  rotate(radians(angle));
  scale(scaleValue);
  scaleValue += rotateScale;
  if (scaleValue > maxScale || scaleValue < 0)
    rotateScale *= -1;
    
  angle += rotateStep;
  if (angle > 360 || angle < 0) {
    rotateStep *= -1;
  }
  
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 5; x++) {
      fill(241,62,245);
      pushMatrix();
      translate((x * (width / 5)) - (width / 2), (y * (height / 5)) - (height / 2));
      rectangles[x][y].Draw();
      popMatrix();
    }
  }
}

void drawRays()
{

  for (int i = 0; i < 18; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians((360/36)*i));
    
    if (i % 2 == 0)
      fill(73,245,62);
    else
      fill(238,245,62);
    float sizew = 21.7;
    triangle(0,0,-sizew, -(width/2), sizew, -(width/2));
    popMatrix();
  }
}

void draw()
{
  int t = 56;
  background(t,161,245);
  
  drawRays();
  
//  saveFrame("frames/frame-####.tiff");
}