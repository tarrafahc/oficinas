///  Marcos Moritz - Material didatido de Processing, 2017
///
///  - Movimentando um objeto por aplicacao de velocidade
///  - Baseie-se nesse exemplo para multiplicar esse objeto com
///o conceito de Classe!

int diametro = 40;
float posicaoX, posicaoY;
float velocidadeX, velocidadeY;

void setup()
{
  size(400, 400);
  frameRate(90);
  posicaoX = 100;
  posicaoY = 110;

  // a velocidade em x será um número aleatório entre 2.00 e 4.99
  velocidadeX = random(2, 5);
  velocidadeY = random(2, 5);
}

void draw() 
{
  background(127);

  posicaoX = posicaoX + velocidadeX;
  posicaoY = posicaoY + velocidadeY;

  if (posicaoX > width) 
  {
    posicaoX = width;
    velocidadeX *= -1;
  } else if (posicaoX < 0) 
  {
    posicaoX = 0;
    velocidadeX = velocidadeX * -1;
  }

  if (posicaoY > height) 
  {
    posicaoY = height;
    velocidadeY = velocidadeY * -1;
  } else if (posicaoY < 0) 
  {
    posicaoY = 0;
    velocidadeY = velocidadeY * -1;
  }

  ellipse(posicaoX, posicaoY, diametro, diametro);
}