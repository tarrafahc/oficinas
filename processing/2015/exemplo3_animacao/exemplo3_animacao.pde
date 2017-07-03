//  Mini-curso de Processing 2
//  Coloquio do LAPPSO-UEM, 2013
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
//
//  JoeSpritesheet.png eh oriundo do jogo Silent Joe.
//  Recurso gentilmente cedido pela TimeWave Games para uso nao-comercial
//

//  Ao abrir JoeSpritesheet.png em um programa de edicao de imagens,
//voce pode conferir que a imagem possui tamanho 1296 x 288 (pixels).
/*final */int SpriteSheetWidth  = 1296;
/*final */int SpriteSheetHeight = 288;

//  Repare que a imagem consiste em 18 colunas e 4 linhas de quadros.
//Notando que cada quadro tem o mesmo tamanho, podemos calcular a
//largura e a altura de um quadro
final int frameWidth  = 72;  //  largura de cada quadro = 1296/18
final int frameHeight = 72;  //  altura de cada quadro = 288/4

int currentFrame;  //  quadro atual
int state;  //  0: correndo, 1: saltando

//  Vamos fazer com que a animacao do Joe troque de quadro 30 vezes por segundo 
int animationFPS = 30;
//  Entao cada drame vai durar 1/30 segundos (ou seja, 33.33333 ms)
float msToChangeJoeFrame = 33.3333333;  //  (= 1/30 * 1000)
int lastMillis;  //  nos ajudarah a calcular timeSinceLastDraw
float timeSinceLastDraw;  //  tempo decorrido entre um frame do programa 
  //e o anterior (ou seja, entre um draw() e outro)

PImage joe_spritesheet;

void setup() {
  size(200, 200);
  joe_spritesheet = loadImage("JoeSpritesheet.png");
  currentFrame = 0;
  //  millis() retorna a quantidade de milisegundos passada desde o inicio do programa
  lastMillis = millis();
  msToChangeJoeFrame = 1000/animationFPS;
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
  
  timeSinceLastDraw = millis() - lastMillis;  //  tempo entre este draw() e o anterior
  msToChangeJoeFrame -= timeSinceLastDraw;
  
  //  Passados msToChangeJoeFrame milisegundos, trocamos o quadro da animacao 
  if(msToChangeJoeFrame < 0) {
    currentFrame++;
    msToChangeJoeFrame = 1000/animationFPS;
  }
  //  Gerenciando a repeticao da animacao:
  if(currentFrame > 17) {
    currentFrame = 0;
    if(state == 1) {  //  quando termina a animacao de pulo, volta 'a de corrida
      state = 0;
      currentFrame = 3;  //  preciosismo... a transicao eh mais suave    
    }
  }
    
  lastMillis = millis();
}

//  Clique do mouse muda animacao para de pulo
void mouseReleased() {
  state = 1;
  currentFrame = 0;
}

