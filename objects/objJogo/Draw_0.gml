/// @desenho_grid Desenha as linhas e colunas

for (var coluna = 0; coluna < numero_colunas; coluna++) {	// Desenha as colunas da grid
	draw_set_alpha(ALPHA_GRID);
	draw_line(coluna * tamanho_celula, 0, coluna * tamanho_celula, room_height);
}

for (var linha = 0; linha < numero_linhas; linha++) {		// Desenha as linhas da grid
	draw_set_alpha(ALPHA_GRID);
	draw_line(0, linha * tamanho_celula, room_width, linha * tamanho_celula);
}

// @desenho_celula Desenha as celulas
var pintar_celula = function (xx, yy, cor) {
	/*
	Pinta o uadrado da grid com a respectiva cor:
		0 - Preto
		1 - Branco
	*/
	draw_set_alpha(1);
	
	var cores = [c_black, c_white];
	
	draw_rectangle_color(
	xx * tamanho_celula + 1,
	yy * tamanho_celula + 1,
	xx * tamanho_celula + tamanho_celula - 1,
	yy * tamanho_celula + tamanho_celula - 1,
	cores[cor],
	cores[cor],
	cores[cor],
	cores[cor],
	false);
}

for (var xx_coluna = 0; xx_coluna < numero_colunas; xx_coluna++) {
	for (var yy_linha = 0; yy_linha < numero_linhas; yy_linha++) {						// Passa por todas as celulas da grid
		if grid[# xx_coluna, yy_linha] == MORTO pintar_celula(xx_coluna, yy_linha, 0);	// Se a celula for morta entao pinta de preto
		else pintar_celula(xx_coluna, yy_linha, 1);										// Se a celula for viva entao pinta de branco
	}
}

