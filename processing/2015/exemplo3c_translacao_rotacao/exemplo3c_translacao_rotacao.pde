//  Mini-curso de Processing 2
//  Coloquio do LAPPSO-UEM, 2013
//  Tiago Brizolara da Rosa
//
//  Nao esqueca de checar os tutoriais oficiais
//    http://processing.org/tutorials/
//  e a referencia
//    http://processing.org/reference/
//
//  Exemplo 3c:
//  - Mais transformacoes: agora combinacao de rotacoes e translacoes
//  - Conceito de pilha de matrizes
//  - De quebra, um bom efeito visual ao clicar com o mouse
//
//  Modificado a partir do exemplo 14-16 do livro Learning Processing,
//de Daniel Shiffman (http://www.learningprocessing.com)

// Angulo de rotacao, em radianos (PI radianos = 180 graus)
float theta = 0;

int mode = 0;  //  0: apaga o quadro anterior antes de desenhar o proximo
               //  1: nao apaga o quadro anterior

void setup() {
  size(200,200);
  //smooth(); nao precisa, o Processing ja aplica suavizacao por padrao
    //(http://www.processing.org/reference/smooth_.html)  
  frameRate(100);
}

void draw() {
  
  if(mode == 0) {  //  Desenha com contornos. E apaga o quadro anterior
    stroke(0);
    background(255);
  } else {  //  Desenha sem contornos e nao apaga o quadro anterior
    noStroke();
  }    
  
  //  Esquema de pilha de matrizes (mais um motivo para aprender
  //programacao com o Processing: conhecer OpenGL)
  //  Pense que as operacoes matriciais (escala, translacao, rotacao)
  //sao aplicadas sobre o sistema de coordenadas de forma cumulativa,
  //na ordem que aparecem. Eh importante desenhar essas operacoes
  //ate ganhar intuicao (veja os slides deste exemplo no pdf do mini-curso)
  pushMatrix();
  
    // Translacao ao centro da janela para desenhar o sol
    translate(width/2,height/2);
    fill(255,200,50);
    ellipse(0,0,20,20);
    
    // A Terra gira ao redor do sol
    rotate(theta);  //  Giramos o sistema de um angulo theta. Para que lado?
      //O padrao aqui no modo 2D eh o sentido horario
    translate(50,0);  //  E transladamos 50 em x (no novo sistema)
    fill(50,200,255, 50);
    ellipse(0,0,10,10);  //  E desenhamos uma elipse 10x10 (ou seja, um circulo 
      //de raio 5) na posicao (0,0). Mas nao esqueca que eh no (0,0) do novo sistema,
      //que sofreu duas translacoes e uma rotacao.
    
    // Moon #1 rotates around the earth
    // pushMatrix() is called to save the transformation state before drawing moon #1. 
    // This way we can pop and return to earth before drawing moon #2. 
    // Both moons rotate around the earth (which itself is rotating around the sun).
    pushMatrix();
      rotate(-theta*4);
      translate(15,0);
      fill(50,255,200, 50);
      ellipse(0,0,6,6);
    popMatrix(); // retirando essa matriz da pilha, voltamos 'a que levava 'a Terra
    
    // Moon #2 also rotates around the earth
    rotate(theta*2);
    translate(25,0);
    fill(255,183,39, 50);
    ellipse(0,0,6,6);
  
  popMatrix();
  
  theta += 0.01;
}

void mouseReleased() {
  if(mode == 0) {
    mode = 1;
    background(255);
  } else {
    mode = 0; 
  }   
}
