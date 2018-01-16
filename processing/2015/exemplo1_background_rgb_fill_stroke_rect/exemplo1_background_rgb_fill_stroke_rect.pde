//  Mini-curso de Processing 2
//  Coloquio do LAPPSO-UEM, 2013
//  Tiago Brizolara da Rosa - nenhum direito reservado
//
//  Nao esqueca de checar os tutoriais oficiais
//    http://processing.org/tutorials/
//  e a referencia
//    http://processing.org/reference/
//
//  Exemplo 1:
//  - Tamanho da tela
//  - Cor de fundo, cor de preenchimento, cor de linha
//  - Posicionamento de elementos graficos na tela

//  Tamanho da tela (em pixels)
size(640,480);

//  Cor do fundo da tela
//  128 eh metade da escala de cinza (0: preto, 255: branco)
background(255);

//  Cor do preenchimento: 
//  maximo de vermelho, maximo de verde, nada de azul = amarelo
fill(255, 255, 0);

//  Cor da linha:
//  maximo de vermelho, metade da escala de verde, nada de azul = laranja
stroke(255, 128, 0);

//  No Processing, o padrao das coordenadas x e y na tela eh:
//
//   (x,y) = (0,0)                 (x,y) = (width-1, 0)
//         ._____________________________.
//         |                             |
//         |    o     /\                 |
//         |         /  \ /\       o_/   |
//         |        /    \  \     /|     |
//         |       -----------    / \    |
//         ._____________________________.
//   (x,y) = (0, height-1)       (x,y) = (width-1, height-1)
//
//
//  A funcao rect desenha um retangulo do seguinte modo:
//
//  rect(x, y, largura, altura)
//
//  Por padrao, x=0 e y=0 se referem ao canto superior esquerdo do retangulo.
//  Entao, voce nem precisa rodar o programa para ver que a chamada 
//abaixo vai desenhar um retangulo com o canto superior esquerdo bem no 
//meio da tela e com 50 pixels de largura e 50 de altura
rect(320, 240, 100, 100);

//  Repare que as cores do preenchimento e do interior sao as que 
//especificamos acima nas chamadas a fill(...) e stroke(...) 



