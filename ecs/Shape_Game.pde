// Ella Engelen | April 10th 2024 | Shape Game
// We tried to figure out how to bring the text forward and make the egg
// less blurry but it didn't work. What did I do wrong?
float x,y,score, tx, ty,tw, speed;
PImage Bunny, Grass, Egg;

void setup() {
  size(500,500);
  //fill();
 // rect(width/2, 0, 120, 50)
  x = width/2;
  y = height/2;
  score = 0.0;
  tx = random(width);
  ty = random (height);
  tw = 100.0;
  speed = 0.3;
  Bunny = loadImage ("BUNNY.png");
  Grass = loadImage ("GRASS.png");
  Egg = loadImage ("eggtarget.png");
}

void draw() {
  image(Grass,width/2,height/2);
  println(dist(x,y,tx,ty));
  score();
  target();
  if (keyPressed) {
    if (key == 'w' || key =='W') {
      y = y - 5;
    } else if(key == 's' || key =='S') {
      y = y + 5;
  }else if(key == 'a' || key =='A') {
      x = x - 5;
  }else if(key == 'd' || key =='D') {
      x = x + 5;
    }
  }
  rectMode(CENTER);
  fill(#F5B4ED);
  if(x < 10) {
    x= width;
  } else if(x > width) {
    x = 0;
  } else if (y < 1) {
    y = height;
  } else if (y > height) {
    y = 0;
  }
  imageMode(CENTER);
  image(Bunny,x,y);
  //rect(x,y,30,30);
  gameOver();
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - 5;
    } else if (keyCode == DOWN) {
      y = y + 5;
      } else if (keyCode == LEFT) {
      x = x - 5;
} else if (keyCode == RIGHT) {
      x = x + 5;
    } 
  } 
}

void score() {
  if(dist(x,y,tx,ty)<20) {
    score = score + 100;
    tx = random(width);
  ty = random (height);
  tw=100;
  speed += 0.1;
  }
  fill(#FFFFFF);
  textSize(25);
  textAlign(CENTER);
  text("SCORE: " + score,width/2,30);
}

void target() {
  fill (#FFFFFF);
  Egg.resize(int(tw),int(tw));
  image(Grass,width/2,height/2);
  image(Egg,tx,ty);
  tw = tw - 0.3;
  fill(#F5B4ED);
  text("x", tx,ty+5);
}

void gameOver() {
  if(tw<1) {
    background(255,0,0);
    fill(255);
    text("GAME OVER", width/2,height/2);
    text("SCORE:"+ score, width/2, height/2+50);
    noLoop();
  }
}
