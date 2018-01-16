///
///  Baseado em https://github.com/CodingTrain/Rainbow-Code/tree/master/Tutorials/Processing/11_video/sketch_15_6_frog_particles
///  e https://youtu.be/WH31daSj4nc?t=14m53s
///
///  A aquarela é de João Aires - https://www.instagram.com/joao_m_aires/
///
///  - Arrays
///  - Classes
///  - get(): inspeciona um valor de pixel
///

Particle[] particles, particlesBlack;
PImage painting;

//-----------------------------------------
class Particle
{
  float x, y, vx, vy;

  Particle() {
    x = width/2;
    y = height/2;
    float a = random(TWO_PI); // angulo da velocidade. Um numero aleatorio entre 0 e 2*PI
    float speed = random(2,4);// modulo da velocidade. Um numero aleatorio entre 2 e 4
    vx = cos(a)*speed; // componente x da velocidade
    vy = sin(a)*speed; // componente y da velocidade
  }

  void display() {
    noStroke();
    color c = painting.get(int(x),int(y));
    fill(c,25);
    ellipse(x, y, 12, 12);
  }

  float distance_sqr = 0;

  void move()
  { 
    // movendo...
    x = x + vx;
    y = y + vy;
    
    // ... e saindo do outro lado sempre que atravessar a tela
    if (y < 0) {
      y = height;
    } 
    if (y > height) {
      y = 0;
    }
    if (x < 0) {
      x = width;
    } 
    if (x > width) {
      x = 0;
    }
  }

}

//-------------------------------------------------------
void setup()
{
  size(1040,700);
  painting = loadImage("joao1.png");
  painting.resize(1040,700);

  particles = new Particle [2500];
  //particlesBlack = new Particle
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
}

void draw()
{
  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].move();
  }
}