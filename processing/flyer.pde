PImage bg;
int x;
int y;
int t;
PFont f;
int cor;
PImage lesser;
String a, b;

void setup() {
  size(200, 200);
  colorMode(RGB, 100);
  bg = loadImage("tarrafa.png");
  background(color(118, 200, 216));
  t=25;
  cor=height;
  f = loadFont("Ubuntu-Light-48.vlw");
  smooth();
  imageMode(CENTER);
  rectMode(CENTER);
  a = "Oficina de Processing";
  b = "Lucas Tonussi \n[at]\nTarrafa Clube Hacker\n16 de Maio 19:30\ntarrafa.net/blog/";
}

void draw() {
  if (mousePressed) {
    for (x = 0; x <= 100; x++) {
      lesser = bg.get (width - x * 30, y, t, t);
      image (lesser, width - x * 30, y);
      cor+=30%height;
      fill(color(cor, random(255), random(255)), 80);
      strokeWeight(0.25);
      rect(width - x * 30, y, t, t);
    }
    y+=50%(height);
  }
}



void keyPressed() {
  //  textFont(f, 40);
  //  fill(255);
  //  text(a, 20, 50);
  //  text(b, 20, 200);
  //  noFill();
  //
  //  if (key == 's') {
  //    this.set(0, 0, this.get(0, 0, width, height));
  //    this.save("pics/novas/frame-" + this.nf(frameCount, 4) + ".png");
  //  }
  x = 0;
  y = 0;
}

