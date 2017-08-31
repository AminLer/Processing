
ArrayList<PVector> path;

float angle = 0;

Orbit sun;
Orbit end;

void setup(){
  size(600, 600);
  path = new ArrayList<PVector>();
  sun = new Orbit(new PVector(300, 300), 150, 0);
  Orbit next = sun; 
  for(int i = 0; i < 4; i++){
    next = next.addChild();
  }
  end = next;
}

void draw(){
  background(51);
  
  Orbit current = sun;
  while(current != null){
    current.show();
    current.update();
    current = current.child;
  }
  
  path.add(new PVector(end.pos.x, end.pos.y));
  
  beginShape();
  stroke(255, 0, 255);
  strokeWeight(4);
  for(PVector pos : path){
    vertex(pos.x, pos.y);

  }endShape();
}