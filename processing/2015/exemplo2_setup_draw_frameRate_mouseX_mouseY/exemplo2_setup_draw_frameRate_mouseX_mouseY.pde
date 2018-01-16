//  Mini-curso de Processing 2
//  Coloquio do LAPPSO-UEM, 2013
//  Tiago Brizolara da Rosa - nenhum direito reservado
//
//  Nao esqueca de checar os tutoriais oficiais
//    http://processing.org/tutorials/
//  e a referencia
//    http://processing.org/reference/
//
//  Exemplo 2:
//  - funcoes setup() e draw()
//  - Variaveis mouseX e mouseY
//  - Interacao!
//  - oportunidade para papear sobre quadros por segundo (frame rate - FPS)

//  Para os novatos em programacao, a primeira novidade: variaveis.
//  Vamos utilizar as variaves mouseX e mouseY, que guardam as coordenadas
//x e y do mouse na tela
//  mouseX e mouseY sao internas ao Processing, mas voce pode criar suas 
//proprias variaveis, como vamos ver nos proximos exemplos
//  Utilizamos variaveis para guardar e reutilizar informacao

//  Outra novidade para os novos programadores: a partir de agora vamos 
//usar blocos de codigo, comumente denominados no mundo da programacao
//por 'funcoes'. Existem funcoes com nomes pre-definidos, reconhecidas
//pelo Processing (usaremos algumas delas neste exemplo. De uma olhadinha
//em processing.org/reference/ para ver todas as possibilidades) e funcoes
//que o usuario pode criar. Este segundo tipo nao usaremos neste exemplo.

//  No processing, se voce declarar a funcao void setup(), como feito 
//abaixo, ela vai ser executada automaticamente quando o programa iniciar.
//  (No proximo exemplo vamos explicar o que eh o 'void')
void setup() { // <--- toda funcao comeca abrindo chaves...
  
  size(255, 255);
  background(0, 0, 255);  //  fundo azul
  noStroke(); // determina que as formas serao desenhadas sem contornos
  
  //  O padrao no Processing eh de 60 quadros/segundo (frames per second - FPS).
  //  Aqui aumentamos para 120, o que vai deixar a experiencia mais suave.
  //  "Epa! Mas a visao humana nao consegue distinguir tantos quadros por 
  //segundo! E se meu monitor mostra so 60 quadros por segundo, tambem nao adianta
  //nada o Processing mostrar 120!" - 1) A visao humana percebe descontinuidades
  //a FPS mais altos que 60 para imagens puramente geometricas (linhas, cores 
  //chapadas...). 2) Neste exemplo, com mais quadros por segundo, mais posicoes
  //intermediarias na movimentacao do mouse sao captadas e mais detalhado seu
  //rastro na tela ficara'. Claro que estamos limitados tambem pela taxa de atualizacao
  //do mouse.
  //  'A medida que um programa se torna mais dispendioso em termos de 
  //processamento (por exemplo, desenhando muitas coisas ao mesmo tempo,
  //fazendo muitos calculos, carregando e manipulando imagens e sons...),
  //o computador nao consegue fazer tantos calculos a tempo. Mas neste caso,
  //este programa muito simples nos permite tentar um FPS mais alto.
  frameRate(120);
  
} // <--- ... e toda funcao termina fechando chaves

//  No processing, a funcao draw() eh executada repetidamente.
//  O padrao eh 30 vezes por segundo. Ou seja, temos uma analogia com
//o cinema, onde sao exibidos ~30 quadros por segundo, dando a ilusao
//de movimento
//  Assim, eh dentro de draw() que vamos programar a parte dinamica
//do nosso programa. "Eh dentro de draw() que as coisas acontecem..."
void draw() {
  
  //  Estamos determinando a cor de preenchimento de acordo com a posicao
  //do mouse na tela (x e y sao 0 no canto superior esquerdo, e crescem 
  //'a direita e para baixo, como vimos no Exemplo 1).
  //  Por exemplo, se o mouse estiver no canto superior esquerdo, 
  //teremos fill(0, 0, 0), que eh preto.
  //  Execute o programa e movimente o mouse na tela para ver o resultado
  fill(mouseX, mouseY, 0);
  
  //  Desenhamos um retangulo com seu canto superior esquerdo na posicao
  //do mouse e tendo 5 pixels de largura e altura
  rect(mouseX, mouseY, 30, 30);
  
}

