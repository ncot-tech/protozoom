class ZoomRect {
  float maxWidth;
  float maxHeight;
  float scaleFactor = 0.01;
  float angle = 0;
  float scaleValue = 0.03;

  ZoomRect(float MaxWidth, float MaxHeight)
  {
    maxWidth = MaxWidth;
    maxHeight = MaxHeight;
  }
  
  void Draw()
  {
    pushMatrix();
    translate(maxWidth/2, maxHeight/2);
    rotate(radians(angle));
    scale(scaleFactor, scaleFactor);
    rect(0, 0, maxWidth, maxHeight);
    popMatrix();
    scaleFactor += scaleValue;
    angle += 3;
    if (scaleFactor > 1) {
      scaleValue = -0.03;
    } else if (scaleFactor < 0.01) {
      scaleValue = 0.03;
    }
    if (angle > 360) {
      angle = 0;
    }
  }
}