float a = 0;

ArrayList<Box> sponge;
void setup(){
  size(400, 400, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, 200);
  sponge.add(b);
}

void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>();
  for(Box b : sponge){
    ArrayList<Box> nextBoxes = b.generate();
    next.addAll(nextBoxes);
  }
  sponge = next;
}

void draw(){
  background(51);
  lights();
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a*0.04);
  rotateZ(a*0.02);
  for(Box b : sponge){
    b.show();
  }
  
 a += 0.01; 
}