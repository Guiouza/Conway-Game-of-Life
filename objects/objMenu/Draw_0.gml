/// @manual Escreve um manual dos controles

var yy = 64;

draw_text(32, yy,
"Comandos:");

draw_text(48, yy + 16,
"Escape:                        Retorna para o guia de comandos (essa tela).");
draw_text(48, yy + 16*2,
"Botao esquerdo:                Cria celulas vivas.");
draw_text(48, yy + 16*3,
"Botao direito:                 Exclui celulas vivas.");
draw_text(48, yy + 16*4,
"Enter:                         Inicia o jogo.");
draw_text(48, yy + 16*5,
"Backspace:                     Reinicia o jogo e apaga todas as celulas. Caso todas as celuas morram ele reiniciara sozinho.");
draw_text(48, yy + 16*6,
"Backspace:                     Reinicia o jogo e apaga todas as celulas.");
draw_text(48, yy + 16*7,
"Seta para cima:                Aumenta a grade duplicando o numero de quadrados, maximo de 2 aumentos.")
draw_text(48, yy + 16*8,
"Seta para baixo:               Diminui a grade pela metade, vem no mínimo por padrao.");;


draw_text(32, yy + 16*10,
"Sitema de salvamento:");

draw_text(48, yy + 16*11,
"Utilize a tecla Home para carregar uma configuração padrao de disparadores, veja a pagina da wikipedia sobre o jogo.");
draw_text(48, yy + 16*12,
"Use <shift + N> sendo N um numero de 0 a 9 para salvar diferentes estados da grid.");
draw_text(48, yy + 16*13,
"Para acessar esses estados apenas digite o numero no qual o salvou anteriormente.");
draw_text(48, yy + 16*14,
"Para excluir uma configuração sava, digite delete + numero.");

draw_text(576, 480,
"PRECIONE ENTER...");
