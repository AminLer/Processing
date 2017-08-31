class Orbit {
  int k = -5;
  PVector pos;
  float r;
  int n;
  Orbit parent;
  Orbit child;
  float speed;
  float angle;

  Orbit(PVector pos_, float r_, int n_) {
    this(pos_, r_, n_, null);
  }

  Orbit(PVector pos_, float r_, int n_, Orbit p) {
    pos = pos_;
    r = r_;
    n = n_;
    parent = p;
    child = null;
    angle = 0;
    
    speed = radians(pow(k, n-1)); 
  }

  Orbit addChild() {
    float newR = r / 3;
    float newX = pos.x+r+newR;
    float newY = pos.y;
    child = new Orbit(new PVector(newX, newY), newR, n+1, this);
    return child;
  }

  void update() {
    if (parent != null) {
      angle += speed;

      float rsum = r + parent.r;
      pos.x = parent.pos.x+rsum * cos(angle);
      pos.y = parent.pos.y+rsum * sin(angle);
    }
  }

  void show() {
    stroke(255, 100);
    noFill();
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}