int scorePlayerA, scorePlayerB, endScore;
int playerAx, playerAy, playerBx, playerBy;
int playerW = 10;
int playerH = 100;
int playerSpeedA, playerSpeedB, speed;

float pongSpeedX;
float pongSpeedY;
int pongX, pongY;

void setup() {
  size(500, 500);
  //Player A Start Position
  playerAx = 10;
  playerAy = height/2-playerH/2;
  //Player B Start Position
  playerBx = width-20;
  playerBy = height/2-playerH/2;
  speed = 5;
  //starting score
  scorePlayerA = 0;
  scorePlayerB = 0;
  endScore = 10; //Final score when the game will end

  //Pong Start Position
  pongX = width/2;
  pongY = height/2;
  while(pongSpeedX == 0 || pongSpeedY == 0){
  pongSpeedX = floor(random(-4, 4));
  pongSpeedY = floor(random(-4, 4));
  }
}

void draw() {
  background(0); //black background
  //line through middle to separte the fields
  fill(255);
  for (int i = 5; i < height; i+=20) {//DECORATION
    rect(width/2-10, i, 10, 10);
  }
  
  //Collision with wall
  checkPlayerCollision();
  drawPlayer(playerAx, playerAy+=playerSpeedA, 255, 0, 0);
  drawPlayer(playerBx, playerBy+=playerSpeedB, 0, 255, 0);
  
  //Collison with player or wall
  checkPongCollision();
  //draw the pong
  drawPong(pongX+=pongSpeedX, pongY+=pongSpeedY);
}

void keyPressed() {
  //First player A
  if (key == 'w' || key == 'W') {
    playerSpeedA = -speed;
  }
  if (key == 's' || key == 'S') {
    playerSpeedA = speed;
  }

  //Second Player B
  if (key == 'o' || key == 'O') {
    playerSpeedB = -speed;
  }
  if (key == 'l' || key == 'L') {
    playerSpeedB = speed;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    playerSpeedA = 0;
  }
  if (key == 'o' || key == 'O' || key == 'l' || key == 'L') {
    playerSpeedB = 0;
  }
}

void checkPlayerCollision(){
  //Player A Collision
  if (playerAy <= 5) {
    playerSpeedA = 0;
    playerAy = 6;
  } else if (playerAy >= width-105) {
    playerSpeedA = 0;
    playerAy = width-106;
  }
  //Player B Collision
  if (playerBy <= 5) {
    playerSpeedB = 0;
    playerBy = 6;
  } else if (playerBy >= width-105) {
    playerSpeedB = 0;
    playerBy = width-106;
  }
}

void checkPongCollision(){
  //Collision with the top and bottom wall
  if(pongY < 0 ){
    //pongSpeedY = -pongSpeedY * random(1, 1.5); // doesnt work it goes crazy when bouncing from top to bottom gets hardcore speed
    pongSpeedY = floor(random(2, 4));//maybe mal irgend ein faktor
  }else if(pongY > height){
    //pongSpeedY = -pongSpeedY * random(1, 1.5);
    pongSpeedY = floor(random(-4, -2));
  }
  
  //Collison with player A
  if(pongX <= playerAx+20 && pongY >= playerAy && pongY <= playerAy+playerH){
    pongSpeedX = floor(random(2, 4));
  }
  //Collison with player B
  if(pongX >= playerBx-10 && pongY >= playerBy && pongY <= playerBy+playerH){
    pongSpeedX = floor(random(-4, -2)); 
  }
  
  //Check the winner! if collieds left or right
  if(pongX > playerBx+10){
    pongSpeedX = -pongSpeedX;
    scorePlayerA++;
    if(scorePlayerA == endScore){
      println("Player A is the WINNER!!");
      noLoop();
    }
  }else if(pongX < playerAx){
    pongSpeedX = -pongSpeedX;
    scorePlayerB++;
    if(scorePlayerB == endScore){
      println("Player B is the WINNER!!");
      noLoop();
    }
  }
  drawScore();
  
}

void drawScore(){
  textSize(20);
  textAlign(CENTER);
  //strokeWeight(2);
  //stroke(255);
  //line(width/4, 0, width/4, height);
  //line(width/4*3, 0, width/4*3, height);
  fill(255, 0, 0);
  text("Player A", width/4, 25);
  text(scorePlayerA, width/4, 50);
  fill(0, 255, 0);
  text("Player B", width/4*3, 25);
  text(scorePlayerB, width/4*3, 50);
  
  
}
void drawPlayer(int xPos, int yPos, int r, int g, int b) {
  fill(r, g, b);
  rect(xPos, yPos, playerW, playerH);
}

void drawPong(int xPos, int yPos){
  
  stroke(255);
  strokeWeight(20);
  point(xPos, yPos);
  strokeWeight(1);
  noStroke();
}
