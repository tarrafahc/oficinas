//  Oficina de Processing 
//  Tiago Brizolara da Rosa
//
//  Nao esqueca de checar os tutoriais oficiais
//    http://processing.org/tutorials/
//  e a referencia
//    http://processing.org/reference/
//
//  Exemplo 3:
//  - Usando PImage:
//    - Carregando uma imagem
//    - Obtendo apenas um trecho de uma imagem
//  - Animacao tradicional para games!
//  - Evento de mouse
//
//  JoeSpritesheet.png eh oriundo do jogo Silent Joe.
//  Recurso gentilmente cedido pela TimeWave Games para uso nao-comercial
//

//  Ao abrir JoeSpritesheet.png em um programa de edicao de imagens,
//voce pode conferir que a imagem possui tamanho 1296 x 288 (pixels).
int SpriteSheetWidth  = 1296;
int SpriteSheetHeight = 288;

//  Repare que a imagem consiste em 18 colunas e 4 linhas de quadros.
//Notando que cada quadro tem o mesmo tamanho, podemos calcular a
//largura e a altura de um quadro
final int frameWidth  = 72;  //  largura de cada quadro = 1296/18
final int frameHeight = 72;  //  altura de cada quadro = 288/4

int currentFrame;  //  quadro atual
int state;  //  0: correndo, 1: saltando

PImage joe_spritesheet;

int counter;

void setup() {
  size(200, 200);
  joe_spritesheet = loadImage("JoeSpritesheet.png");
  currentFrame = 0;
  counter = 0;
}

void draw() {
  
  //  A cada comeco de frame, pintamos toda a tela de preto
  //  Comente esta linha para ver o que acontece...
  background(0);
  
  text("click to show jump animation", 10, 20);
  
  //  Com get() pegamos exatamente o quadro que desejamos (de uma olhada na 
  //descricao de get(): processing.org/reference/PImage_get_.html)
  image(joe_spritesheet.get(currentFrame*frameWidth, state*frameHeight,
      frameWidth, frameHeight), 70, 75);
  
  //  Atualizando quadro da animacao
  counter++;
  if(counter > 2) {
    currentFrame++;
    counter = 0;
  }

  //  Gerenciando a repeticao da animacao:
  if(currentFrame > 17) {
    currentFrame = 0;
    if(state == 1) {  //  quando termina a animacao de pulo, volta 'a de corrida
      state = 0;
    }
  }
}

//  Clique do mouse muda animacao para de pulo
void mouseReleased() {
  state = 1;
  currentFrame = 0;
}